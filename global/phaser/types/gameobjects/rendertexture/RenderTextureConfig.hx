package global.phaser.types.gameobjects.rendertexture;

typedef RenderTextureConfig = {
	/**
		The x coordinate of the RenderTextures position.
	**/
	@:optional
	var x : Float;
	/**
		The y coordinate of the RenderTextures position.
	**/
	@:optional
	var y : Float;
	/**
		The width of the RenderTexture.
	**/
	@:optional
	var width : Float;
	/**
		The height of the RenderTexture.
	**/
	@:optional
	var height : Float;
	/**
		The texture key to make the RenderTexture from.
	**/
	@:optional
	var key : String;
	/**
		the frame to make the RenderTexture from.
	**/
	@:optional
	var frame : String;
};