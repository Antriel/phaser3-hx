package global.phaser.types.tilemaps;

typedef CreateFromObjectLayerConfig = {
	/**
		A unique Object ID to convert.
	**/
	@:optional
	var id : Float;
	/**
		An Object GID to convert.
	**/
	@:optional
	var gid : Float;
	/**
		An Object Name to convert.
	**/
	@:optional
	var name : String;
	/**
		A custom class type to convert the objects in to.
	**/
	@:optional
	var classType : global.phaser.gameobjects.GameObject;
	/**
		A Scene reference, passed to the Game Objects constructors.
	**/
	@:optional
	var scene : global.phaser.Scene;
	/**
		Optional Container to which the Game Objects are added.
	**/
	@:optional
	var container : global.phaser.gameobjects.Container;
	/**
		Optional key of a Texture to be used, as stored in the Texture Manager, or a Texture instance.
	**/
	@:optional
	var key : ts.AnyOf2<String, global.phaser.textures.Texture>;
	/**
		Optional name or index of the frame within the Texture.
	**/
	@:optional
	var frame : ts.AnyOf2<String, Float>;
};