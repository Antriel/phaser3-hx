package global;

/**
	A configuration object that may be applied to a Context Choose operation.
**/
typedef ChooseContextConfig = {
	/**
		The set of filters to apply to the context suggestions: 'NEW_CONTEXT_ONLY', 'INCLUDE_EXISTING_CHALLENGES' or 'NEW_PLAYERS_ONLY'.
	**/
	@:optional
	var filters : Array<String>;
	/**
		The maximum number of participants that a suggested context should ideally have.
	**/
	@:optional
	var maxSize : Float;
	/**
		The minimum number of participants that a suggested context should ideally have.
	**/
	@:optional
	var minSize : Float;
};