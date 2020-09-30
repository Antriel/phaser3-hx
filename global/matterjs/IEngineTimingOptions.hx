package global.matterjs;

typedef IEngineTimingOptions = {
	/**
		A `Number` that specifies the global scaling factor of time for all bodies.
		A value of `0` freezes the simulation.
		A value of `0.1` gives a slow-motion effect.
		A value of `1.2` gives a speed-up effect.
	**/
	var timeScale : Float;
	/**
		A `Number` that specifies the current simulation-time in milliseconds starting from `0`.
		It is incremented on every `Engine.update` by the given `delta` argument.
	**/
	var timestamp : Float;
};