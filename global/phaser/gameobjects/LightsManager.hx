package global.phaser.gameobjects;

/**
	Manages Lights for a Scene.
	
	Affects the rendering of Game Objects using the `Light2D` pipeline.
**/
@:native("Phaser.GameObjects.LightsManager") extern class LightsManager {
	function new();
	/**
		The Lights in the Scene.
	**/
	var lights : Array<Light>;
	/**
		The ambient color.
	**/
	var ambientColor : global.phaser.display.RGB;
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
		The number of lights that the LightPipeline processed in the _previous_ frame.
	**/
	final visibleLights : Float;
	/**
		Enable the Lights Manager.
	**/
	function enable():LightsManager;
	/**
		Disable the Lights Manager.
	**/
	function disable():LightsManager;
	/**
		Get all lights that can be seen by the given Camera.
		
		It will automatically cull lights that are outside the world view of the Camera.
		
		If more lights are returned than supported by the pipeline, the lights are then culled
		based on the distance from the center of the camera. Only those closest are rendered.
	**/
	function getLights(camera:global.phaser.cameras.scene2d.Camera):Array<Light>;
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