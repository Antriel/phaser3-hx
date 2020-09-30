package global.phaser.gameobjects;

/**
	A Bob Game Object.
	
	A Bob belongs to a Blitter Game Object. The Blitter is responsible for managing and rendering this object.
	
	A Bob has a position, alpha value and a frame from a texture that it uses to render with. You can also toggle
	the flipped and visible state of the Bob. The Frame the Bob uses to render can be changed dynamically, but it
	must be a Frame within the Texture used by the parent Blitter.
	
	Bob positions are relative to the Blitter parent. So if you move the Blitter parent, all Bob children will
	have their positions impacted by this change as well.
	
	You can manipulate Bob objects directly from your game code, but the creation and destruction of them should be
	handled via the Blitter parent.
**/
@:native("Phaser.GameObjects.Bob") extern class Bob {
	function new(blitter:Blitter, x:Float, y:Float, frame:ts.AnyOf2<String, Float>, visible:Bool);
	/**
		The Blitter object that this Bob belongs to.
	**/
	var parent : Blitter;
	/**
		The x position of this Bob, relative to the x position of the Blitter.
	**/
	var x : Float;
	/**
		The y position of this Bob, relative to the y position of the Blitter.
	**/
	var y : Float;
	/**
		The frame that the Bob uses to render with.
		To change the frame use the `Bob.setFrame` method.
	**/
	private var frame : global.phaser.textures.Frame;
	/**
		A blank object which can be used to store data related to this Bob in.
	**/
	var data : Dynamic;
	/**
		The tint value of this Bob.
	**/
	var tint : Float;
	/**
		The horizontally flipped state of the Bob.
		A Bob that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture.
	**/
	var flipX : Bool;
	/**
		The vertically flipped state of the Bob.
		A Bob that is flipped vertically will render inversed on the vertical axis (i.e. upside down)
		Flipping always takes place from the middle of the texture.
	**/
	var flipY : Bool;
	/**
		Changes the Texture Frame being used by this Bob.
		The frame must be part of the Texture the parent Blitter is using.
		If no value is given it will use the default frame of the Blitter parent.
	**/
	function setFrame(?frame:ts.AnyOf3<String, Float, global.phaser.textures.Frame>):Bob;
	/**
		Resets the horizontal and vertical flipped state of this Bob back to their default un-flipped state.
	**/
	function resetFlip():Bob;
	/**
		Resets this Bob.
		
		Changes the position to the values given, and optionally changes the frame.
		
		Also resets the flipX and flipY values, sets alpha back to 1 and visible to true.
	**/
	function reset(x:Float, y:Float, ?frame:ts.AnyOf3<String, Float, global.phaser.textures.Frame>):Bob;
	/**
		Changes the position of this Bob to the values given.
	**/
	function setPosition(x:Float, y:Float):Bob;
	/**
		Sets the horizontal flipped state of this Bob.
	**/
	function setFlipX(value:Bool):Bob;
	/**
		Sets the vertical flipped state of this Bob.
	**/
	function setFlipY(value:Bool):Bob;
	/**
		Sets the horizontal and vertical flipped state of this Bob.
	**/
	function setFlip(x:Bool, y:Bool):Bob;
	/**
		Sets the visibility of this Bob.
		
		An invisible Bob will skip rendering.
	**/
	function setVisible(value:Bool):Bob;
	/**
		Set the Alpha level of this Bob. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
		
		A Bob with alpha 0 will skip rendering.
	**/
	function setAlpha(value:Float):Bob;
	/**
		Sets the tint of this Bob.
	**/
	function setTint(value:Float):Bob;
	/**
		Destroys this Bob instance.
		Removes itself from the Blitter and clears the parent, frame and data properties.
	**/
	function destroy():Void;
	/**
		The visible state of the Bob.
		
		An invisible Bob will skip rendering.
	**/
	var visible : Bool;
	/**
		The alpha value of the Bob, between 0 and 1.
		
		A Bob with alpha 0 will skip rendering.
	**/
	var alpha : Float;
	static var prototype : Bob;
}