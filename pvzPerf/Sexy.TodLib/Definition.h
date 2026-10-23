#pragma once

#include "TodParticle.h"

bool                    FloatTrackIsSet(const FloatParameterTrack& theTrack);
float                   FloatTrackEvaluate(FloatParameterTrack& theTrack, float theTimeValue, float theInterp);
float                   FloatTrackEvaluateFromLastTime(FloatParameterTrack& theTrack, float theTimeValue, float theInterp);
bool                    FloatTrackIsConstantZero(FloatParameterTrack& theTrack);
