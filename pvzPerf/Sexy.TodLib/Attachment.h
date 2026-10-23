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
enum class ReanimTimeDomain : std::uint32_t;

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

    void                    Update();
    void                    UpdateAt(std::int64_t nowNs, ReanimTimeDomain domain);
    void                    SetPosition(const SexyVector2& thePosition);
    void                    SetMatrix(const SexyTransform2D& theMatrix);
    void                    OverrideColor(const Color& theColor);
    void                    OverrideScale(float theScale);
    void                    Draw(Graphics* g, bool theParentHidden);
    void                    AttachmentDie();
    void                    Detach();
    void                    CrossFade(ParticleEmitterName theName);
    void                    CrossFade(ParticleEmitterNameRange theRange);
    void                    PropogateColor(const Color& theColor, bool theEnableAdditiveColor, const Color& theAdditiveColor, bool theEnableOverlayColor, const Color& theOverlayColor);
};

AttachEffect*               AttachReanim(AttachmentID& theAttachmentID, Reanimation* theReanimation, float theOffsetX, float theOffsetY);
AttachEffect*               AttachParticle(AttachmentID& theAttachmentID, TodParticleSystem* theParticleSystem, float theOffsetX, float theOffsetY);
/*inline*/ void             AttachmentPropogateColor(AttachmentID& theAttachmentID, const Color& theColor, bool theEnableAdditiveColor, const Color& theAdditiveColor, bool theEnableOverlayColor, const Color& theOverlayColor);
/*inline*/ void             AttachmentOverrideColor(AttachmentID& theAttachmentID, const Color& theColor);
/*inline*/ void             AttachmentOverrideScale(AttachmentID& theAttachmentID, float theScale);
/*inline*/ void             AttachmentUpdateAndMove(AttachmentID& theAttachmentID, float theX, float theY);
void                        AttachmentUpdateAndMoveAt(AttachmentID& theAttachmentID, float theX, float theY, std::int64_t nowNs, ReanimTimeDomain domain);
/*inline*/ void             AttachmentUpdateAndSetMatrix(AttachmentID& theAttachmentID, SexyTransform2D& theMatrix);
void                        AttachmentUpdateAndSetMatrixAt(AttachmentID& theAttachmentID, SexyTransform2D& theMatrix, std::int64_t nowNs, ReanimTimeDomain domain);
/*inline*/ void             AttachmentDraw(AttachmentID& theAttachmentID, Graphics* g, bool theParentHidden);
/*inline*/ void             AttachmentDetach(AttachmentID& theAttachmentID);
/*inline*/ void             AttachmentDetachCrossFadeParticleType(AttachmentID& theAttachmentID, ParticleEffect theParticleEffect);
/*inline*/ void             AttachmentDetachCrossFadeParticleType(AttachmentID& theAttachmentID, ParticleEffect theParticleEffect, ParticleEmitterName theName);
/*inline*/ void             AttachmentDetachCrossFadeParticleType(AttachmentID& theAttachmentID, ParticleEffect theParticleEffect, ParticleEmitterNameRange theRange);
/*inline*/ void             AttachmentReanimTypeDie(AttachmentID& theAttachmentID, ReanimationType theReanimType);
/*inline*/ void             AttachmentDie(AttachmentID& theAttachmentID);
/*inline*/ void             AttachmentCrossFade(AttachmentID& theAttachmentID, ParticleEmitterName theName);
/*inline*/ void             AttachmentCrossFade(AttachmentID& theAttachmentID, ParticleEmitterNameRange theRange);
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
