package global.phaser.types.tilemaps;

typedef ObjectLayerConfig = {
	/**
		The name of the Object Layer.
	**/
	@:optional
	var name : String;
	/**
		The opacity of the layer, between 0 and 1.
	**/
	@:optional
	var opacity : Float;
	/**
		The custom properties defined on the Object Layer, keyed by their name.
	**/
	@:optional
	var properties : Dynamic;
	/**
		The type of each custom property defined on the Object Layer, keyed by its name.
	**/
	@:optional
	var propertytypes : Dynamic;
	/**
		The type of the layer, which should be `objectgroup`.
	**/
	@:optional
	var type : String;
	/**
		Whether the layer is shown (`true`) or hidden (`false`).
	**/
	@:optional
	var visible : Bool;
	/**
		An array of all objects on this Object Layer.
	**/
	@:optional
	var objects : Array<Dynamic>;
};