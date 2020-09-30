package global.phaser.types.gameobjects.bitmaptext;

typedef DisplayCallbackConfig = {
	/**
		The Dynamic Bitmap Text object that owns this character being rendered.
	**/
	var parent : global.phaser.gameobjects.DynamicBitmapText;
	/**
		The tint of the character being rendered. Always zero in Canvas.
	**/
	var tint : TintConfig;
	/**
		The index of the character being rendered.
	**/
	var index : Float;
	/**
		The character code of the character being rendered.
	**/
	var charCode : Float;
	/**
		The x position of the character being rendered.
	**/
	var x : Float;
	/**
		The y position of the character being rendered.
	**/
	var y : Float;
	/**
		The scale of the character being rendered.
	**/
	var scale : Float;
	/**
		The rotation of the character being rendered.
	**/
	var rotation : Float;
	/**
		Custom data stored with the character being rendered.
	**/
	var data : Dynamic;
};