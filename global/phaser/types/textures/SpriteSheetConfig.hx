package global.phaser.types.textures;

typedef SpriteSheetConfig = {
	/**
		The fixed width of each frame.
	**/
	var frameWidth : Float;
	/**
		The fixed height of each frame. If not set it will use the frameWidth as the height.
	**/
	@:optional
	var frameHeight : Float;
	/**
		Skip a number of frames. Useful when there are multiple sprite sheets in one Texture.
	**/
	@:optional
	var startFrame : Float;
	/**
		The total number of frames to extract from the Sprite Sheet. The default value of -1 means "extract all frames".
	**/
	@:optional
	var endFrame : Float;
	/**
		If the frames have been drawn with a margin, specify the amount here.
	**/
	@:optional
	var margin : Float;
	/**
		If the frames have been drawn with spacing between them, specify the amount here.
	**/
	@:optional
	var spacing : Float;
};