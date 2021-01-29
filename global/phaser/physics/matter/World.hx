package global.phaser.physics.matter;

/**
	The Matter World class is responsible for managing one single instance of a Matter Physics World for Phaser.
	
	Access this via `this.matter.world` from within a Scene.
	
	This class creates a Matter JS World Composite along with the Matter JS Engine during instantiation. It also
	handles delta timing, bounds, body and constraint creation and debug drawing.
	
	If you wish to access the Matter JS World object directly, see the `localWorld` property.
	If you wish to access the Matter Engine directly, see the `engine` property.
	
	This class is an Event Emitter and will proxy _all_ Matter JS events, as they are received.
**/
@:native("Phaser.Physics.Matter.World") extern class World extends global.phaser.events.EventEmitter {
	function new(scene:global.phaser.Scene, config:global.phaser.types.physics.matter.MatterWorldConfig);
	/**
		The Scene to which this Matter World instance belongs.
	**/
	var scene : global.phaser.Scene;
	/**
		An instance of the MatterJS Engine.
	**/
	var engine : global.matterjs.Engine;
	/**
		A `World` composite object that will contain all simulated bodies and constraints.
	**/
	var localWorld : global.matterjs.World;
	/**
		An object containing the 4 wall bodies that bound the physics world.
	**/
	var walls : Dynamic;
	/**
		A flag that toggles if the world is enabled or not.
	**/
	var enabled : Bool;
	/**
		The correction argument is an optional Number that specifies the time correction factor to apply to the update.
		This can help improve the accuracy of the simulation in cases where delta is changing between updates.
		The value of correction is defined as delta / lastDelta, i.e. the percentage change of delta over the last step.
		Therefore the value is always 1 (no correction) when delta is constant (or when no correction is desired, which is the default).
		See the paper on Time Corrected Verlet for more information.
	**/
	var correction : Float;
	/**
		This function is called every time the core game loop steps, which is bound to the
		Request Animation Frame frequency unless otherwise modified.
		
		The function is passed two values: `time` and `delta`, both of which come from the game step values.
		
		It must return a number. This number is used as the delta value passed to Matter.Engine.update.
		
		You can override this function with your own to define your own timestep.
		
		If you need to update the Engine multiple times in a single game step then call
		`World.update` as many times as required. Each call will trigger the `getDelta` function.
		If you wish to have full control over when the Engine updates then see the property `autoUpdate`.
		
		You can also adjust the number of iterations that Engine.update performs.
		Use the Scene Matter Physics config object to set the following properties:
		
		positionIterations (defaults to 6)
		velocityIterations (defaults to 4)
		constraintIterations (defaults to 2)
		
		Adjusting these values can help performance in certain situations, depending on the physics requirements
		of your game.
	**/
	var getDelta : haxe.Constraints.Function;
	/**
		The Matter JS Runner Configuration object.
		
		This object is populated via the Matter Configuration object's `runner` property and is
		updated constantly during the game step.
	**/
	var runner : global.phaser.types.physics.matter.MatterRunnerConfig;
	/**
		Automatically call Engine.update every time the game steps.
		If you disable this then you are responsible for calling `World.step` directly from your game.
		If you call `set60Hz` or `set30Hz` then `autoUpdate` is reset to `true`.
	**/
	var autoUpdate : Bool;
	/**
		A flag that controls if the debug graphics will be drawn to or not.
	**/
	var drawDebug : Bool;
	/**
		An instance of the Graphics object the debug bodies are drawn to, if enabled.
	**/
	var debugGraphic : global.phaser.gameobjects.Graphics;
	/**
		The debug configuration object.
		
		The values stored in this object are read from the Matter World Config `debug` property.
		
		When a new Body or Constraint is _added to the World_, they are given the values stored in this object,
		unless they have their own `render` object set that will override them.
		
		Note that while you can modify the values of properties in this object at run-time, it will not change
		any of the Matter objects _already added_. It will only impact objects newly added to the world, or one
		that is removed and then re-added at a later time.
	**/
	var debugConfig : global.phaser.types.physics.matter.MatterDebugConfig;
	/**
		Sets the debug render style for the children of the given Matter Composite.
		
		Composites themselves do not render, but they can contain bodies, constraints and other composites that may do.
		So the children of this composite are passed to the `setBodyRenderStyle`, `setCompositeRenderStyle` and
		`setConstraintRenderStyle` methods accordingly.
	**/
	function setCompositeRenderStyle(composite:global.matterjs.CompositeType):World;
	/**
		Sets the debug render style for the given Matter Body.
		
		If you are using this on a Phaser Game Object, such as a Matter Sprite, then pass in the body property
		to this method, not the Game Object itself.
		
		If you wish to skip a parameter, so it retains its current value, pass `false` for it.
		
		If you wish to reset the Body render colors to the defaults found in the World Debug Config, then call
		this method with just the `body` parameter provided and no others.
	**/
	function setBodyRenderStyle(body:global.matterjs.BodyType, ?lineColor:Float, ?lineOpacity:Float, ?lineThickness:Float, ?fillColor:Float, ?fillOpacity:Float):World;
	/**
		Sets the debug render style for the given Matter Constraint.
		
		If you are using this on a Phaser Game Object, then pass in the body property
		to this method, not the Game Object itself.
		
		If you wish to skip a parameter, so it retains its current value, pass `false` for it.
		
		If you wish to reset the Constraint render colors to the defaults found in the World Debug Config, then call
		this method with just the `constraint` parameter provided and no others.
	**/
	function setConstraintRenderStyle(constraint:global.matterjs.ConstraintType, ?lineColor:Float, ?lineOpacity:Float, ?lineThickness:Float, ?pinSize:Float, ?anchorColor:Float, ?anchorSize:Float):World;
	/**
		This internal method acts as a proxy between all of the Matter JS events and then re-emits them
		via this class.
	**/
	function setEventsProxy():Void;
	/**
		Sets the bounds of the Physics world to match the given world pixel dimensions.
		You can optionally set which 'walls' to create: left, right, top or bottom.
		If none of the walls are given it will default to use the walls settings it had previously.
		I.e. if you previously told it to not have the left or right walls, and you then adjust the world size
		the newly created bounds will also not have the left and right walls.
		Explicitly state them in the parameters to override this.
	**/
	function setBounds(?x:Float, ?y:Float, ?width:Float, ?height:Float, ?thickness:Float, ?left:Bool, ?right:Bool, ?top:Bool, ?bottom:Bool):World;
	/**
		Updates the 4 rectangle bodies that were created, if `setBounds` was set in the Matter config, to use
		the new positions and sizes. This method is usually only called internally via the `setBounds` method.
	**/
	function updateWall(add:Bool, ?position:String, ?x:Float, ?y:Float, ?width:Float, ?height:Float):Void;
	/**
		Creates a Phaser.GameObjects.Graphics object that is used to render all of the debug bodies and joints to.
		
		This method is called automatically by the constructor, if debugging has been enabled.
		
		The created Graphics object is automatically added to the Scene at 0x0 and given a depth of `Number.MAX_VALUE`,
		so it renders above all else in the Scene.
		
		The Graphics object is assigned to the `debugGraphic` property of this class and `drawDebug` is enabled.
	**/
	function createDebugGraphic():global.phaser.gameobjects.Graphics;
	/**
		Sets the world gravity and gravity scale to 0.
	**/
	function disableGravity():World;
	/**
		Sets the worlds gravity to the values given.
		
		Gravity effects all bodies in the world, unless they have the `ignoreGravity` flag set.
	**/
	function setGravity(?x:Float, ?y:Float, ?scale:Float):World;
	/**
		Creates a rectangle Matter body and adds it to the world.
	**/
	function create(x:Float, y:Float, width:Float, height:Float, options:Dynamic):global.matterjs.BodyType;
	/**
		Adds a Matter JS object, or array of objects, to the world.
		
		The objects should be valid Matter JS entities, such as a Body, Composite or Constraint.
		
		Triggers `beforeAdd` and `afterAdd` events.
	**/
	function add(object:ts.AnyOf2<Dynamic, Array<Dynamic>>):World;
	/**
		Removes a Matter JS object, or array of objects, from the world.
		
		The objects should be valid Matter JS entities, such as a Body, Composite or Constraint.
		
		Triggers `beforeRemove` and `afterRemove` events.
	**/
	function remove(object:ts.AnyOf2<Dynamic, Array<Dynamic>>, ?deep:Bool):World;
	/**
		Removes a Matter JS constraint, or array of constraints, from the world.
		
		Triggers `beforeRemove` and `afterRemove` events.
	**/
	function removeConstraint(constraint:ts.AnyOf2<global.matterjs.ConstraintType, Array<global.matterjs.ConstraintType>>, ?deep:Bool):World;
	/**
		Adds `MatterTileBody` instances for all the colliding tiles within the given tilemap layer.
		
		Set the appropriate tiles in your layer to collide before calling this method!
	**/
	function convertTilemapLayer(tilemapLayer:global.phaser.tilemaps.TilemapLayer, ?options:Dynamic):World;
	/**
		Adds `MatterTileBody` instances for the given tiles. This adds bodies regardless of whether the
		tiles are set to collide or not.
	**/
	function convertTiles(tiles:Array<global.phaser.tilemaps.Tile>, ?options:Dynamic):World;
	/**
		Returns the next unique group index for which bodies will collide.
		If `isNonColliding` is `true`, returns the next unique group index for which bodies will not collide.
	**/
	function nextGroup(?isNonColliding:Bool):Float;
	/**
		Returns the next unique category bitfield (starting after the initial default category 0x0001).
		There are 32 available.
	**/
	function nextCategory():Float;
	/**
		Pauses this Matter World instance and sets `enabled` to `false`.
		
		A paused world will not run any simulations for the duration it is paused.
	**/
	function pause():World;
	/**
		Resumes this Matter World instance from a paused state and sets `enabled` to `true`.
	**/
	function resume():World;
	/**
		The internal update method. This is called automatically by the parent Scene.
		
		Moves the simulation forward in time by delta ms. Uses `World.correction` value as an optional number that
		specifies the time correction factor to apply to the update. This can help improve the accuracy of the
		simulation in cases where delta is changing between updates. The value of correction is defined as `delta / lastDelta`,
		i.e. the percentage change of delta over the last step. Therefore the value is always 1 (no correction) when
		delta is constant (or when no correction is desired, which is the default).
		See the paper on Time Corrected Verlet for more information.
		
		Triggers `beforeUpdate` and `afterUpdate` events. Triggers `collisionStart`, `collisionActive` and `collisionEnd` events.
		
		If the World is paused, `update` is still run, but exits early and does not update the Matter Engine.
	**/
	function update(time:Float, delta:Float):Void;
	/**
		Manually advances the physics simulation by one iteration.
		
		You can optionally pass in the `delta` and `correction` values to be used by Engine.update.
		If undefined they use the Matter defaults of 60Hz and no correction.
		
		Calling `step` directly bypasses any checks of `enabled` or `autoUpdate`.
		
		It also ignores any custom `getDelta` functions, as you should be passing the delta
		value in to this call.
		
		You can adjust the number of iterations that Engine.update performs internally.
		Use the Scene Matter Physics config object to set the following properties:
		
		positionIterations (defaults to 6)
		velocityIterations (defaults to 4)
		constraintIterations (defaults to 2)
		
		Adjusting these values can help performance in certain situations, depending on the physics requirements
		of your game.
	**/
	function step(?delta:Float, ?correction:Float):Void;
	/**
		Runs the Matter Engine.update at a fixed timestep of 60Hz.
	**/
	function update60Hz():Float;
	/**
		Runs the Matter Engine.update at a fixed timestep of 30Hz.
	**/
	function update30Hz():Float;
	/**
		Returns `true` if the given body can be found within the World.
	**/
	function has(body:ts.AnyOf2<global.phaser.gameobjects.GameObject, global.matterjs.Body>):Array<global.matterjs.BodyType>;
	/**
		Returns all the bodies in the Matter World, including all bodies in children, recursively.
	**/
	function getAllBodies():Array<global.matterjs.BodyType>;
	/**
		Returns all the constraints in the Matter World, including all constraints in children, recursively.
	**/
	function getAllConstraints():Array<global.matterjs.ConstraintType>;
	/**
		Returns all the composites in the Matter World, including all composites in children, recursively.
	**/
	function getAllComposites():Array<global.matterjs.CompositeType>;
	/**
		Renders the Engine Broadphase Controller Grid to the given Graphics instance.
		
		The debug renderer calls this method if the `showBroadphase` config value is set.
		
		This method is used internally by the Matter Debug Renderer, but is also exposed publically should
		you wish to render the Grid to your own Graphics instance.
	**/
	function renderGrid(grid:global.matterjs.Grid, graphics:global.phaser.gameobjects.Graphics, lineColor:Float, lineOpacity:Float):World;
	/**
		Renders the list of Pair separations to the given Graphics instance.
		
		The debug renderer calls this method if the `showSeparations` config value is set.
		
		This method is used internally by the Matter Debug Renderer, but is also exposed publically should
		you wish to render the Grid to your own Graphics instance.
	**/
	function renderSeparations(pairs:Array<global.matterjs.Pair>, graphics:global.phaser.gameobjects.Graphics, lineColor:Float):World;
	/**
		Renders the list of collision points and normals to the given Graphics instance.
		
		The debug renderer calls this method if the `showCollisions` config value is set.
		
		This method is used internally by the Matter Debug Renderer, but is also exposed publically should
		you wish to render the Grid to your own Graphics instance.
	**/
	function renderCollisions(pairs:Array<global.matterjs.Pair>, graphics:global.phaser.gameobjects.Graphics, lineColor:Float):World;
	/**
		Renders the bounds of an array of Bodies to the given Graphics instance.
		
		If the body is a compound body, it will render the bounds for the parent compound.
		
		The debug renderer calls this method if the `showBounds` config value is set.
		
		This method is used internally by the Matter Debug Renderer, but is also exposed publically should
		you wish to render bounds to your own Graphics instance.
	**/
	function renderBodyBounds(bodies:Array<Dynamic>, graphics:global.phaser.gameobjects.Graphics, lineColor:Float, lineOpacity:Float):Void;
	/**
		Renders either all axes, or a single axis indicator, for an array of Bodies, to the given Graphics instance.
		
		The debug renderer calls this method if the `showAxes` or `showAngleIndicator` config values are set.
		
		This method is used internally by the Matter Debug Renderer, but is also exposed publically should
		you wish to render bounds to your own Graphics instance.
	**/
	function renderBodyAxes(bodies:Array<Dynamic>, graphics:global.phaser.gameobjects.Graphics, showAxes:Bool, lineColor:Float, lineOpacity:Float):Void;
	/**
		Renders a velocity indicator for an array of Bodies, to the given Graphics instance.
		
		The debug renderer calls this method if the `showVelocity` config value is set.
		
		This method is used internally by the Matter Debug Renderer, but is also exposed publically should
		you wish to render bounds to your own Graphics instance.
	**/
	function renderBodyVelocity(bodies:Array<Dynamic>, graphics:global.phaser.gameobjects.Graphics, lineColor:Float, lineOpacity:Float, lineThickness:Float):Void;
	/**
		Renders a single Matter Body to the given Phaser Graphics Game Object.
		
		This method is used internally by the Matter Debug Renderer, but is also exposed publically should
		you wish to render a Body to your own Graphics instance.
		
		If you don't wish to render a line around the body, set the `lineColor` parameter to `null`.
		Equally, if you don't wish to render a fill, set the `fillColor` parameter to `null`.
	**/
	function renderBody(body:global.matterjs.BodyType, graphics:global.phaser.gameobjects.Graphics, showInternalEdges:Bool, ?lineColor:Float, ?lineOpacity:Float, ?lineThickness:Float, ?fillColor:Float, ?fillOpacity:Float):World;
	/**
		Renders the Convex Hull for a single Matter Body to the given Phaser Graphics Game Object.
		
		This method is used internally by the Matter Debug Renderer, but is also exposed publically should
		you wish to render a Body hull to your own Graphics instance.
	**/
	function renderConvexHull(body:global.matterjs.BodyType, graphics:global.phaser.gameobjects.Graphics, hullColor:Float, ?lineThickness:Float):World;
	/**
		Renders a single Matter Constraint, such as a Pin or a Spring, to the given Phaser Graphics Game Object.
		
		This method is used internally by the Matter Debug Renderer, but is also exposed publically should
		you wish to render a Constraint to your own Graphics instance.
	**/
	function renderConstraint(constraint:global.matterjs.ConstraintType, graphics:global.phaser.gameobjects.Graphics, lineColor:Float, lineOpacity:Float, lineThickness:Float, pinSize:Float, anchorColor:Float, anchorSize:Float):World;
	/**
		Resets the internal collision IDs that Matter.JS uses for Body collision groups.
		
		You should call this before destroying your game if you need to restart the game
		again on the same page, without first reloading the page. Or, if you wish to
		consistently destroy a Scene that contains Matter.js and then run it again
		later in the same game.
	**/
	function resetCollisionIDs():Void;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):World;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):World;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):World;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):World;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):World;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):World;
	static var prototype : World;
}