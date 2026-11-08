#pragma once
#include "ConstEnums.h"
#include "generated/ParticleEmitterName.h"
#include "DataArray.h"
#include "misc/SexyMatrix.h"

namespace Sexy
{
    class Graphics;
}
using namespace Sexy;

#define MAX_EFFECTS_PER_ATTACHMENT 16

class Reanimation;
class TodParticleSystem;

class AttachEffect
{
public:
    unsigned int            mEffectID;
    EffectType              mEffectType;
    SexyTransform2D         mOffset;
    bool                    mDontDrawIfParentHidden;
    bool                    mDontPropogateColor;
};

class Attachment
{
public:
    AttachEffect            mEffectArray[MAX_EFFECTS_PER_ATTACHMENT];
    int                     mNumEffects;
    bool                    mDead;

public:
    Attachment();
    ~Attachment();

    void                    UpdateAt(std::int64_t nowNs, std::uint64_t deltaNs);
    void                    RebaseClock(std::int64_t previousNowNs, std::int64_t nowNs);
    void                    SetPosition(const SexyVector2& thePosition);
    void                    SetMatrix(const SexyTransform2D& theMatrix);
    void                    OverrideColor(const Color& theColor);
    void                    OverrideScale(float theScale);
    void                    Draw(Graphics* g, bool theParentHidden, std::int64_t nowNs);
    void                    AttachmentDie();
    void                    Detach(std::int64_t previousNowNs, std::int64_t nowNs);
    void                    CrossFade(ParticleEmitterName theName, std::int64_t nowNs);
    void                    CrossFade(ParticleEmitterNameRange theRange, std::int64_t nowNs);
    void                    PropogateColor(const Color& theColor, bool theEnableAdditiveColor, const Color& theAdditiveColor, bool theEnableOverlayColor, const Color& theOverlayColor);
};

AttachEffect*               AttachReanim(AttachmentID& theAttachmentID, Reanimation* theReanimation, float theOffsetX, float theOffsetY);
AttachEffect*               AttachParticle(AttachmentID& theAttachmentID, TodParticleSystem* theParticleSystem, float theOffsetX, float theOffsetY);
/*inline*/ void             AttachmentPropogateColor(AttachmentID& theAttachmentID, const Color& theColor, bool theEnableAdditiveColor, const Color& theAdditiveColor, bool theEnableOverlayColor, const Color& theOverlayColor);
/*inline*/ void             AttachmentOverrideColor(AttachmentID& theAttachmentID, const Color& theColor);
/*inline*/ void             AttachmentOverrideScale(AttachmentID& theAttachmentID, float theScale);
void                        AttachmentUpdateAndMoveAt(AttachmentID& theAttachmentID, float theX, float theY, std::int64_t nowNs, std::uint64_t deltaNs);
void                        AttachmentUpdateAndSetMatrixAt(AttachmentID& theAttachmentID, SexyTransform2D& theMatrix, std::int64_t nowNs, std::uint64_t deltaNs);
/*inline*/ void             AttachmentDraw(AttachmentID& theAttachmentID, Graphics* g, bool theParentHidden, std::int64_t nowNs);
/*inline*/ void             AttachmentDetach(AttachmentID& theAttachmentID, std::int64_t previousNowNs, std::int64_t nowNs);
/*inline*/ void             AttachmentDetachCrossFadeParticleType(AttachmentID& theAttachmentID, ParticleEffect theParticleEffect);
/*inline*/ void             AttachmentDetachCrossFadeParticleType(AttachmentID& theAttachmentID, ParticleEffect theParticleEffect, ParticleEmitterName theName, std::int64_t nowNs);
/*inline*/ void             AttachmentDetachCrossFadeParticleType(AttachmentID& theAttachmentID, ParticleEffect theParticleEffect, ParticleEmitterNameRange theRange, std::int64_t nowNs);
/*inline*/ void             AttachmentReanimTypeDie(AttachmentID& theAttachmentID, ReanimationType theReanimType);
/*inline*/ void             AttachmentDie(AttachmentID& theAttachmentID);
/*inline*/ void             AttachmentCrossFade(AttachmentID& theAttachmentID, ParticleEmitterName theName, std::int64_t nowNs);
/*inline*/ void             AttachmentCrossFade(AttachmentID& theAttachmentID, ParticleEmitterNameRange theRange, std::int64_t nowNs);
AttachEffect*               FindFirstAttachment(AttachmentID& theAttachmentID);
Reanimation*                FindReanimAttachment(AttachmentID& theAttachmentID);
AttachEffect*               CreateEffectAttachment(AttachmentID& theAttachmentID, EffectType theEffectType, unsigned int theDataID, float theOffsetX, float theOffsetY);
/*inline*/ bool             IsFullOfAttachments(AttachmentID& theAttachmentID);

class AttachmentHolder
{
public:
    DataArray<Attachment>   mAttachments;

public:
    AttachmentHolder();
    ~AttachmentHolder();

    void                    InitializeHolder();
    void                    DisposeHolder();
    Attachment*             AllocAttachment();
};
