package global.phaser.gameobjects;

/**
	A 2D point light.
	
	These are typically created by a {@link Phaser.GameObjects.LightsManager}, available from within a scene via `this.lights`.
	
	Any Game Objects using the Light2D pipeline will then be affected by these Lights as long as they have a normal map.
	
	They can also simply be used to represent a point light for your own purposes.
**/
@:native("Phaser.GameObjects.Light") extern class Light extends global.phaser.geom.Circle {
	function new(x:Float, y:Float, radius:Float, r:Float, g:Float, b:Float, intensity:Float);
	/**
		The color of the light.
	**/
	var color : global.phaser.display.RGB;
	/**
		The intensity of the light.
	**/
	var intensity : Float;
	/**
		Compares the renderMask with the renderFlags to see if this Game Object will render or not.
		Also checks the Game Object against the given Cameras exclusion list.
	**/
	function willRender(camera:global.phaser.cameras.scene2d.Camera):Bool;
	/**
		Set the color of the light from a single integer RGB value.
	**/
	function setColor(rgb:Float):Light;
	/**
		Set the intensity of the light.
	**/
	function setIntensity(intensity:Float):Light;
	/**
		Set the radius of the light.
	**/
	function setRadius(radius:Float):Light;
	/**
		The horizontal scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorX : Float;
	/**
		The vertical scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorY : Float;
	/**
		Sets the scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	function setScrollFactor(x:Float, ?y:Float):Light;
	/**
		The visible state of the Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	var visible : Bool;
	/**
		Sets the visibility of this Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	function setVisible(value:Bool):Light;
	/**
		Sets the x, y and radius of this circle.
	**/
	function setTo(?x:Float, ?y:Float, ?radius:Float):Light;
	/**
		Sets this Circle to be empty with a radius of zero.
		Does not change its position.
	**/
	function setEmpty():Light;
	/**
		Sets the position of this Circle.
	**/
	function setPosition(?x:Float, ?y:Float):Light;
	static var prototype : Light;
	/**
		The bitmask that `GameObject.renderFlags` is compared against to determine if the Game Object will render or not.
	**/
	static final RENDER_MASK : Float;
}