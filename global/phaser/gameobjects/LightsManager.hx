package global.phaser.gameobjects;

/**
	Manages Lights for a Scene.
	
	Affects the rendering of Game Objects using the `Light2D` pipeline.
**/
@:native("Phaser.GameObjects.LightsManager") extern class LightsManager {
	function new();
	/**
		The pool of Lights.
		
		Used to recycle removed Lights for a more efficient use of memory.
	**/
	var lightPool : Array<Light>;
	/**
		The Lights in the Scene.
	**/
	var lights : Array<Light>;
	/**
		Lights that have been culled from a Camera's viewport.
		
		Lights in this list will not be rendered.
	**/
	var culledLights : Array<Light>;
	/**
		The ambient color.
	**/
	var ambientColor : Dynamic;
	/**
		Whether the Lights Manager is enabled.
	**/
	var active : Bool;
	/**
		The maximum number of lights that a single Camera and the lights shader can process.
		Change this via the `maxLights` property in your game config, as it cannot be changed at runtime.
	**/
	final maxLights : Float;
	/**
		Enable the Lights Manager.
	**/
	function enable():LightsManager;
	/**
		Disable the Lights Manager.
	**/
	function disable():LightsManager;
	/**
		Cull any Lights that aren't visible to the given Camera.
		
		Culling Lights improves performance by ensuring that only Lights within a Camera's viewport are rendered.
	**/
	function cull(camera:global.phaser.cameras.scene2d.Camera):Array<Light>;
	/**
		Iterate over each Light with a callback.
	**/
	function forEachLight(callback:global.LightForEach):LightsManager;
	/**
		Set the ambient light color.
	**/
	function setAmbientColor(rgb:Float):LightsManager;
	/**
		Returns the maximum number of Lights allowed to appear at once.
	**/
	function getMaxVisibleLights():Float;
	/**
		Get the number of Lights managed by this Lights Manager.
	**/
	function getLightCount():Float;
	/**
		Add a Light.
	**/
	function addLight(?x:Float, ?y:Float, ?radius:Float, ?rgb:Float, ?intensity:Float):Light;
	/**
		Remove a Light.
	**/
	function removeLight(light:Light):LightsManager;
	/**
		Shut down the Lights Manager.
		
		Recycles all active Lights into the Light pool, resets ambient light color and clears the lists of Lights and
		culled Lights.
	**/
	function shutdown():Void;
	/**
		Destroy the Lights Manager.
		
		Cleans up all references by calling {@link Phaser.GameObjects.LightsManager#shutdown}.
	**/
	function destroy():Void;
	static var prototype : LightsManager;
}