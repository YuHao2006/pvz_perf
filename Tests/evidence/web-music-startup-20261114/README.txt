Web music startup correction after v4.0.3

The click-to-start path owns one 30-second audio initialization/module-load budget. Real MO3 load calls wait for acknowledgement from the decoder owner. Exhaustion is nonfatal and silent; the worker and queued load/seek/gain/play commands survive and can complete later. Ordinary worker state barriers remain separate. No native backend or DAT64 fields changed.

Desktop Edge/Chromium: normal startup, held worker-ready messages and held load/state messages all enter the game, retain 168 effect sources, and recover all three MO3 modules after release. Only the long startup timer is accelerated in the failure tests; game clocks are unchanged. Four memory-model/backend combinations load/draw/Quit and share IDBFS. Missing sync acknowledgement, module failure, decoder error, ScriptProcessor fallback and suspend/resume remain nonfatal. No new Bilibili mobile or iOS hardware test.
