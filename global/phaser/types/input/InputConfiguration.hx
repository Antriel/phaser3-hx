package global.phaser.types.input;

typedef InputConfiguration = {
	/**
		The object / shape to use as the Hit Area. If not given it will try to create a Rectangle based on the texture frame.
	**/
	@:optional
	var hitArea : Dynamic;
	/**
		The callback that determines if the pointer is within the Hit Area shape or not.
	**/
	@:optional
	dynamic function hitAreaCallback(hitArea:Dynamic, x:Float, y:Float, gameObject:global.phaser.gameobjects.GameObject):Void;
	/**
		If `true` the Interactive Object will be set to be draggable and emit drag events.
	**/
	@:optional
	var draggable : Bool;
	/**
		If `true` the Interactive Object will be set to be a drop zone for draggable objects.
	**/
	@:optional
	var dropZone : Bool;
	/**
		If `true` the Interactive Object will set the `pointer` hand cursor when a pointer is over it. This is a short-cut for setting `cursor: 'pointer'`.
	**/
	@:optional
	var useHandCursor : Bool;
	/**
		The CSS string to be used when the cursor is over this Interactive Object.
	**/
	@:optional
	var cursor : String;
	/**
		If `true` the a pixel perfect function will be set for the hit area callback. Only works with texture based Game Objects.
	**/
	@:optional
	var pixelPerfect : Bool;
	/**
		If `pixelPerfect` is set, this is the alpha tolerance threshold value used in the callback.
	**/
	@:optional
	var alphaTolerance : Float;
};