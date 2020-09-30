package global.phaser.types.input.keyboard;

typedef KeyComboConfig = {
	/**
		If they press the wrong key do we reset the combo?
	**/
	@:optional
	var resetOnWrongKey : Bool;
	/**
		The max delay in ms between each key press. Above this the combo is reset. 0 means disabled.
	**/
	@:optional
	var maxKeyDelay : Float;
	/**
		If previously matched and they press the first key of the combo again, will it reset?
	**/
	@:optional
	var resetOnMatch : Bool;
	/**
		If the combo matches, will it delete itself?
	**/
	@:optional
	var deleteOnMatch : Bool;
};