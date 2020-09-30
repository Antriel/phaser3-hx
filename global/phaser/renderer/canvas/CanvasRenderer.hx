package global.phaser.renderer.canvas;

/**
	The Canvas Renderer is responsible for managing 2D canvas rendering contexts, including the one used by the Game's canvas. It tracks the internal state of a given context and can renderer textured Game Objects to it, taking into account alpha, blending, and scaling.
**/
@:native("Phaser.Renderer.Canvas.CanvasRenderer") extern class CanvasRenderer {
	function new(game:global.phaser.Game);
	/**
		The Phaser Game instance that owns this renderer.
	**/
	var game : global.phaser.Game;
	/**
		A constant which allows the renderer to be easily identified as a Canvas Renderer.
	**/
	var type : Float;
	/**
		The total number of Game Objects which were rendered in a frame.
	**/
	var drawCount : Float;
	/**
		The width of the canvas being rendered to.
	**/
	var width : Float;
	/**
		The height of the canvas being rendered to.
	**/
	var height : Float;
	/**
		The local configuration settings of the CanvasRenderer.
	**/
	var config : Dynamic;
	/**
		The canvas element which the Game uses.
	**/
	var gameCanvas : js.html.CanvasElement;
	/**
		The canvas context used to render all Cameras in all Scenes during the game loop.
	**/
	var gameContext : js.html.CanvasRenderingContext2D;
	/**
		The canvas context currently used by the CanvasRenderer for all rendering operations.
	**/
	var currentContext : js.html.CanvasRenderingContext2D;
	/**
		Should the Canvas use Image Smoothing or not when drawing Sprites?
	**/
	var antialias : Bool;
	/**
		The blend modes supported by the Canvas Renderer.
		
		This object maps the {@link Phaser.BlendModes} to canvas compositing operations.
	**/
	var blendModes : Array<Dynamic>;
	/**
		Details about the currently scheduled snapshot.
		
		If a non-null `callback` is set in this object, a snapshot of the canvas will be taken after the current frame is fully rendered.
	**/
	var snapshotState : global.phaser.types.renderer.snapshot.SnapshotState;
	/**
		Prepares the game canvas for rendering.
	**/
	function init():Void;
	/**
		The event handler that manages the `resize` event dispatched by the Scale Manager.
	**/
	function onResize(gameSize:global.phaser.structs.Size, baseSize:global.phaser.structs.Size, displaySize:global.phaser.structs.Size, ?resolution:Float):Void;
	/**
		Resize the main game canvas.
	**/
	function resize(?width:Float, ?height:Float):Void;
	/**
		Resets the transformation matrix of the current context to the identity matrix, thus resetting any transformation.
	**/
	function resetTransform():Void;
	/**
		Sets the blend mode (compositing operation) of the current context.
	**/
	function setBlendMode(blendMode:String):CanvasRenderer;
	/**
		Changes the Canvas Rendering Context that all draw operations are performed against.
	**/
	function setContext(?ctx:js.html.CanvasRenderingContext2D):CanvasRenderer;
	/**
		Sets the global alpha of the current context.
	**/
	function setAlpha(alpha:Float):CanvasRenderer;
	/**
		Called at the start of the render loop.
	**/
	function preRender():Void;
	/**
		Renders the Scene to the given Camera.
	**/
	function render(scene:global.phaser.Scene, children:global.phaser.gameobjects.DisplayList, interpolationPercentage:Float, camera:global.phaser.cameras.scene2d.Camera):Void;
	/**
		Restores the game context's global settings and takes a snapshot if one is scheduled.
		
		The post-render step happens after all Cameras in all Scenes have been rendered.
	**/
	function postRender():Void;
	/**
		Takes a snapshot of the given area of the given canvas.
		
		Unlike the other snapshot methods, this one is processed immediately and doesn't wait for the next render.
		
		Snapshots work by creating an Image object from the canvas data, this is a blocking process, which gets
		more expensive the larger the canvas size gets, so please be careful how you employ this in your game.
	**/
	function snapshotCanvas(canvas:js.html.CanvasElement, callback:global.phaser.types.renderer.snapshot.SnapshotCallback, ?getPixel:Bool, ?x:Float, ?y:Float, ?width:Float, ?height:Float, ?type:String, ?encoderOptions:Float):CanvasRenderer;
	/**
		Schedules a snapshot of the entire game viewport to be taken after the current frame is rendered.
		
		To capture a specific area see the `snapshotArea` method. To capture a specific pixel, see `snapshotPixel`.
		
		Only one snapshot can be active _per frame_. If you have already called `snapshotPixel`, for example, then
		calling this method will override it.
		
		Snapshots work by creating an Image object from the canvas data, this is a blocking process, which gets
		more expensive the larger the canvas size gets, so please be careful how you employ this in your game.
	**/
	function snapshot(callback:global.phaser.types.renderer.snapshot.SnapshotCallback, ?type:String, ?encoderOptions:Float):CanvasRenderer;
	/**
		Schedules a snapshot of the given area of the game viewport to be taken after the current frame is rendered.
		
		To capture the whole game viewport see the `snapshot` method. To capture a specific pixel, see `snapshotPixel`.
		
		Only one snapshot can be active _per frame_. If you have already called `snapshotPixel`, for example, then
		calling this method will override it.
		
		Snapshots work by creating an Image object from the canvas data, this is a blocking process, which gets
		more expensive the larger the canvas size gets, so please be careful how you employ this in your game.
	**/
	function snapshotArea(x:Float, y:Float, width:Float, height:Float, callback:global.phaser.types.renderer.snapshot.SnapshotCallback, ?type:String, ?encoderOptions:Float):CanvasRenderer;
	/**
		Schedules a snapshot of the given pixel from the game viewport to be taken after the current frame is rendered.
		
		To capture the whole game viewport see the `snapshot` method. To capture a specific area, see `snapshotArea`.
		
		Only one snapshot can be active _per frame_. If you have already called `snapshotArea`, for example, then
		calling this method will override it.
		
		Unlike the other two snapshot methods, this one will return a `Color` object containing the color data for
		the requested pixel. It doesn't need to create an internal Canvas or Image object, so is a lot faster to execute,
		using less memory.
	**/
	function snapshotPixel(x:Float, y:Float, callback:global.phaser.types.renderer.snapshot.SnapshotCallback):CanvasRenderer;
	/**
		Takes a Sprite Game Object, or any object that extends it, and draws it to the current context.
	**/
	function batchSprite(sprite:global.phaser.gameobjects.GameObject, frame:global.phaser.textures.Frame, camera:global.phaser.cameras.scene2d.Camera, ?parentTransformMatrix:global.phaser.gameobjects.components.TransformMatrix):Void;
	/**
		Destroys all object references in the Canvas Renderer.
	**/
	function destroy():Void;
	static var prototype : CanvasRenderer;
}