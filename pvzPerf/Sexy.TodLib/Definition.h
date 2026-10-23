#pragma once

#include "TodParticle.h"

bool                    FloatTrackIsSet(const FloatParameterTrack& theTrack);
float                   FloatTrackEvaluate(const FloatParameterTrack& theTrack, double theTimeValue, float theInterp);
float                   FloatTrackEvaluateFromLastTime(const FloatParameterTrack& theTrack, double theTimeValue, float theInterp);
bool                    FloatTrackIsConstantZero(FloatParameterTrack& theTrack);
