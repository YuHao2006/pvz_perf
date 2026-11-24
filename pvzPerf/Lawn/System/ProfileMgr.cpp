#include "DataSync.h"
#include "ProfileMgr.h"
#include "PendingSaveRecovery.h"
#include "Sexy.TodLib/TodDebug.h"
#include <algorithm>
#include <charconv>
#include <filesystem>
#include <limits>
#include <set>
#include <string_view>
#include <vector>
#include "PlayerInfo.h"
#include "SexyAppFramework/SexyAppBase.h"

using namespace Sexy;
static int gProfileVersion = 14;

//0x46A7C0
// GOTY @Patoke: 0x46EBC0
PlayerInfo* ProfileMgr::GetAnyProfile()
{
    std::vector<PlayerInfo*> ordered;
    for (auto& entry : mProfileMap)
        ordered.push_back(&entry.second);
    std::stable_sort(ordered.begin(), ordered.end(), [](const PlayerInfo* a, const PlayerInfo* b) {
        return a->mUseSeq > b->mUseSeq;
    });
    for (PlayerInfo* player : ordered) {
        if (player->LoadDetails()) {
            player->mUseSeq = mNextProfileUseSeq++;
            return player;
        }
    }
    return nullptr;
}

//0x46A7F0
void ProfileMgr::Clear()
{
    mProfileMap.clear();
    mNextProfileId = 1U;
    mNextProfileUseSeq = 1U;
}

//0x46A830
void ProfileMgr::SyncState(DataSync& theSync)
{
    DataReader* aReader = theSync.mReader;
    DataWriter* aWriter = theSync.mWriter;

    int aVersion = gProfileVersion;
    theSync.SyncLong(aVersion);
    theSync.mVersion = aVersion;
    if (aVersion == gProfileVersion)
    {
        if (aReader)
        {
            mProfileMap.clear();

            unsigned int aMaxProfileId = 0;
            unsigned int aMaxUseSeq = 0;
            for (int aProfileCount = aReader->ReadShort(); aProfileCount > 0; aProfileCount--)
            {
                PlayerInfo aProfile;
                aProfile.SyncSummary(theSync);

                if (aProfile.mId > aMaxProfileId)
                    aMaxProfileId = aProfile.mId;
                if (aProfile.mUseSeq > aMaxUseSeq)
                    aMaxUseSeq = aProfile.mUseSeq;

                mProfileMap[aProfile.mName] = aProfile;
            }

            mNextProfileId = aMaxProfileId + 1;
            mNextProfileUseSeq = aMaxUseSeq + 1;
        }
        else
        {
            aWriter->WriteShort((short)mProfileMap.size());
            
            for (auto anItr = mProfileMap.begin(); anItr != mProfileMap.end(); anItr++)
                anItr->second.SyncSummary(theSync);
        }
    }
}

//0x46ABC0
void ProfileMgr::Load()
{
    PendingSaves::RecoverDirectory(GetAppDataFolder());
    Buffer aBuffer;
    std::string aFileName = GetAppDataFolder() + "users.dat";

    try
    {
        if (gSexyAppBase->ReadBufferFromFile(aFileName, &aBuffer, false))
        {
            DataReader aReader;
            aReader.OpenMemory(aBuffer.GetDataPtr(), aBuffer.GetDataLen(), false);
            DataSync aSync(aReader);
            SyncState(aSync);
        }
    }
    catch (DataReaderException&)
    {
        Clear();
    }
}

//0x46AD80
bool ProfileMgr::Save()
{
    DataWriter aWriter;
    aWriter.OpenMemory(0x20);
    DataSync aSync(aWriter);
    SyncState(aSync);

    MkDir(GetAppDataFolder());
    std::string aFileName = GetAppDataFolder() + "users.dat";
    if (gSexyAppBase->WriteBytesToFile(aFileName, aWriter.GetDataPtr(), aWriter.GetDataLen()))
        return true;
    TodErrorMessageBox(("Could not save the player list to " + aFileName).c_str(), "Save failed");
    return false;
}

void ProfileMgr::DeleteProfile(ProfileMap::iterator theProfile)
{
    theProfile->second.DeleteUserFiles();
    mProfileMap.erase(theProfile);
}

//0x46AF70
bool ProfileMgr::DeleteProfile(const SexyString& theName)
{
    auto anItr = mProfileMap.find(theName);
    if (anItr == mProfileMap.end())
        return false;

    DeleteProfile(anItr);
    return true;
}

//0x46AFF0
bool ProfileMgr::RenameProfile(const SexyString& theOldName, const SexyString& theNewName)
{
    auto anOldItr = mProfileMap.find(theOldName);
    if (anOldItr == mProfileMap.end())
        return false;
    else
    {
        // 判断修改前后的用户名是否一致，一致则直接在原存档中进行修改，否则需要额外操作
        if (_stricmp(theOldName.c_str(), theNewName.c_str()) == 0)
            anOldItr->second.mName = theNewName;
        else
        {
            // 向 mProfileMap 中插入一个由新用户名及旧存档组成的对组
            auto aRet = mProfileMap.emplace(theNewName, anOldItr->second);  // auto aRet = mProfileMap.insert({theNewName, anOldItr->second});
            // 通过返回值检测新用户名是否与原有存档重复，重复则返回 false，插入成功则继续操作
            if (!aRet.second)
                return false;
            else
            {
                // 删除 mProfileMap 中原用户名及旧存档的键值对
                mProfileMap.erase(anOldItr);
                // 修改新插入的键值对中存档的用户名
                aRet.first->second.mName = theNewName;
            }
        }
        return true;
    }
}

//0x46B290
// GOTY @Patoke: 0x46F7C0
PlayerInfo* ProfileMgr::GetProfile(const SexyString& theName)
{
    auto anItr = mProfileMap.find(theName);
    if (anItr != mProfileMap.end())
    {
        PlayerInfo* aProfile = &anItr->second;
        if (!aProfile->LoadDetails()) return nullptr;
        aProfile->mUseSeq = mNextProfileUseSeq++;
        return aProfile;
    }
    return nullptr;
}

static unsigned int FindFreeProfileId(unsigned int first)
{
    // An imported users.dat may no longer list other users still on disk.
    const std::filesystem::path directory(GetAppDataFolder());
    std::set<unsigned int> occupied;
    for (const auto& entry : std::filesystem::directory_iterator(directory)) {
        auto path = entry.path();
        const auto pending = PendingSaves::TargetName(path.filename().string());
        if (!pending.empty()) path = pending;
        if (path.extension() != ".dat64" && path.extension() != ".dat") continue;
        const auto stem = path.stem().string();
        const std::string_view name(stem);
        if (!name.starts_with("user") && !name.starts_with("game")) continue;
        const char* end = stem.data() + stem.size();
        unsigned int id;
        const auto parsed = std::from_chars(stem.data() + 4, end, id);
        if (parsed.ec == std::errc{} && (name.starts_with("user") ? parsed.ptr == end :
                parsed.ptr != end && *parsed.ptr == '_'))
            occupied.insert(id);
    }
    while (first && first <= std::numeric_limits<int>::max() && occupied.contains(first))
        ++first;
    if (!first || first > std::numeric_limits<int>::max())
        throw std::runtime_error("No free player ID");
    return first;
}

//0x46B310
PlayerInfo* ProfileMgr::AddProfile(const SexyString& theName)
{
    if (mProfileMap.contains(theName)) return nullptr;

    MkDir(GetAppDataFolder());
    try {
        mNextProfileId = FindFreeProfileId(mNextProfileId);
    } catch (const std::runtime_error& error) {
        TodErrorMessageBox(error.what(), "Cannot create player");
        return nullptr;
    }
    PlayerInfo player;
    player.mName = theName;
    player.mId = mNextProfileId++;
    player.mUseSeq = mNextProfileUseSeq++;
    if (!player.SaveDetails()) return nullptr;
    auto slot = mProfileMap.emplace(theName, player).first;
    // Retire the oldest user only after the replacement index is on disk.
    ProfileMap::node_type retired;
    if (mProfileMap.size() > 200) {
        auto oldest = mProfileMap.end();
        for (auto it = mProfileMap.begin(); it != mProfileMap.end(); ++it) {
            if (it != slot && (oldest == mProfileMap.end() || it->second.mUseSeq < oldest->second.mUseSeq))
                oldest = it;
        }
        retired = mProfileMap.extract(oldest);
    }
    if (!Save()) {
        mProfileMap.erase(slot);
        if (!retired.empty()) mProfileMap.insert(std::move(retired));
        gSexyAppBase->EraseFile(GetAppDataFolder() + StrFormat("user%u.dat64", player.mId));
        return nullptr;
    }
    if (!retired.empty()) retired.mapped().DeleteUserFiles();
    return &slot->second;
}
