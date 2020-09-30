package global.phaser.physics.matter;

/**
	The Phaser Matter plugin provides the ability to use the Matter JS Physics Engine within your Phaser games.
	
	Unlike Arcade Physics, the other physics system provided with Phaser, Matter JS is a full-body physics system.
	It features:
	
	* Rigid bodies
	* Compound bodies
	* Composite bodies
	* Concave and convex hulls
	* Physical properties (mass, area, density etc.)
	* Restitution (elastic and inelastic collisions)
	* Collisions (broad-phase, mid-phase and narrow-phase)
	* Stable stacking and resting
	* Conservation of momentum
	* Friction and resistance
	* Constraints
	* Gravity
	* Sleeping and static bodies
	* Rounded corners (chamfering)
	* Views (translate, zoom)
	* Collision queries (raycasting, region tests)
	* Time scaling (slow-mo, speed-up)
	
	Configuration of Matter is handled via the Matter World Config object, which can be passed in either the
	Phaser Game Config, or Phaser Scene Config. Here is a basic example:
	
	```js
	physics: {
	     default: 'matter',
	     matter: {
	         enableSleeping: true,
	         gravity: {
	             y: 0
	         },
	         debug: {
	             showBody: true,
	             showStaticBody: true
	         }
	     }
	}
	```
	
	This class acts as an interface between a Phaser Scene and a single instance of the Matter Engine.
	
	Use it to access the most common Matter features and helper functions.
	
	You can find details, documentation and examples on the Matter JS website: https://brm.io/matter-js/
**/
@:native("Phaser.Physics.Matter.MatterPhysics") extern class MatterPhysics {
	function new(scene:global.phaser.Scene);
	/**
		The Phaser Scene that owns this Matter Physics instance
	**/
	var scene : global.phaser.Scene;
	/**
		A reference to the Scene Systems that belong to the Scene owning this Matter Physics instance.
	**/
	var systems : global.phaser.scenes.Systems;
	/**
		The parsed Matter Configuration object.
	**/
	var config : global.phaser.types.physics.matter.MatterWorldConfig;
	/**
		An instance of the Matter World class. This class is responsible for the updating of the
		Matter Physics world, as well as handling debug drawing functions.
	**/
	var world : World;
	/**
		An instance of the Matter Factory. This class provides lots of functions for creating a
		wide variety of physics objects and adds them automatically to the Matter World.
		
		You can use this class to cut-down on the amount of code required in your game, however,
		use of the Factory is entirely optional and should be seen as a development aid. It's
		perfectly possible to create and add components to the Matter world without using it.
	**/
	var add : Factory;
	/**
		An instance of the Body Bounds class. This class contains functions used for getting the
		world position from various points around the bounds of a physics body.
	**/
	var bodyBounds : BodyBounds;
	/**
		A reference to the `Matter.Body` module.
		
		The `Matter.Body` module contains methods for creating and manipulating body models.
		A `Matter.Body` is a rigid body that can be simulated by a `Matter.Engine`.
		Factories for commonly used body configurations (such as rectangles, circles and other polygons) can be found in the `Bodies` module.
	**/
	var body : global.matterjs.BodyFactory;
	/**
		A reference to the `Matter.Composite` module.
		
		The `Matter.Composite` module contains methods for creating and manipulating composite bodies.
		A composite body is a collection of `Matter.Body`, `Matter.Constraint` and other `Matter.Composite`, therefore composites form a tree structure.
		It is important to use the functions in this module to modify composites, rather than directly modifying their properties.
		Note that the `Matter.World` object is also a type of `Matter.Composite` and as such all composite methods here can also operate on a `Matter.World`.
	**/
	var composite : global.matterjs.CompositeFactory;
	/**
		A reference to the `Matter.Detector` module.
		
		The `Matter.Detector` module contains methods for detecting collisions given a set of pairs.
	**/
	var detector : global.matterjs.DetectorFactory;
	/**
		A reference to the `Matter.Grid` module.
		
		The `Matter.Grid` module contains methods for creating and manipulating collision broadphase grid structures.
	**/
	var grid : global.matterjs.GridFactory;
	/**
		A reference to the `Matter.Pair` module.
		
		The `Matter.Pair` module contains methods for creating and manipulating collision pairs.
	**/
	var pair : global.matterjs.PairFactory;
	/**
		A reference to the `Matter.Pairs` module.
		
		The `Matter.Pairs` module contains methods for creating and manipulating collision pair sets.
	**/
	var pairs : global.matterjs.PairsFactory;
	/**
		A reference to the `Matter.Query` module.
		
		The `Matter.Query` module contains methods for performing collision queries.
	**/
	var query : global.matterjs.QueryFactory;
	/**
		A reference to the `Matter.Resolver` module.
		
		The `Matter.Resolver` module contains methods for resolving collision pairs.
	**/
	var resolver : global.matterjs.ResolverFactory;
	/**
		A reference to the `Matter.SAT` module.
		
		The `Matter.SAT` module contains methods for detecting collisions using the Separating Axis Theorem.
	**/
	var sat : global.matterjs.SATFactory;
	/**
		A reference to the `Matter.Constraint` module.
		
		The `Matter.Constraint` module contains methods for creating and manipulating constraints.
		Constraints are used for specifying that a fixed distance must be maintained between two bodies (or a body and a fixed world-space position).
		The stiffness of constraints can be modified to create springs or elastic.
	**/
	var constraint : global.matterjs.ConstraintFactory;
	/**
		A reference to the `Matter.Bodies` module.
		
		The `Matter.Bodies` module contains factory methods for creating rigid bodies
		with commonly used body configurations (such as rectangles, circles and other polygons).
	**/
	var bodies : global.matterjs.BodiesFactory;
	/**
		A reference to the `Matter.Composites` module.
		
		The `Matter.Composites` module contains factory methods for creating composite bodies
		with commonly used configurations (such as stacks and chains).
	**/
	var composites : global.matterjs.CompositesFactory;
	/**
		A reference to the `Matter.Axes` module.
		
		The `Matter.Axes` module contains methods for creating and manipulating sets of axes.
	**/
	var axes : global.matterjs.AxesFactory;
	/**
		A reference to the `Matter.Bounds` module.
		
		The `Matter.Bounds` module contains methods for creating and manipulating axis-aligned bounding boxes (AABB).
	**/
	var bounds : global.matterjs.BoundsFactory;
	/**
		A reference to the `Matter.Svg` module.
		
		The `Matter.Svg` module contains methods for converting SVG images into an array of vector points.
		
		To use this module you also need the SVGPathSeg polyfill: https://github.com/progers/pathseg
	**/
	var svg : global.matterjs.SvgFactory;
	/**
		A reference to the `Matter.Vector` module.
		
		The `Matter.Vector` module contains methods for creating and manipulating vectors.
		Vectors are the basis of all the geometry related operations in the engine.
		A `Matter.Vector` object is of the form `{ x: 0, y: 0 }`.
	**/
	var vector : global.matterjs.VectorFactory;
	/**
		A reference to the `Matter.Vertices` module.
		
		The `Matter.Vertices` module contains methods for creating and manipulating sets of vertices.
		A set of vertices is an array of `Matter.Vector` with additional indexing properties inserted by `Vertices.create`.
		A `Matter.Body` maintains a set of vertices to represent the shape of the object (its convex hull).
	**/
	var vertices : global.matterjs.VerticesFactory;
	/**
		A reference to the `Matter.Vertices` module.
		
		The `Matter.Vertices` module contains methods for creating and manipulating sets of vertices.
		A set of vertices is an array of `Matter.Vector` with additional indexing properties inserted by `Vertices.create`.
		A `Matter.Body` maintains a set of vertices to represent the shape of the object (its convex hull).
	**/
	var verts : global.matterjs.VerticesFactory;
	/**
		This internal method is called when this class starts and retrieves the final Matter World Config.
	**/
	function getConfig():global.phaser.types.physics.matter.MatterWorldConfig;
	/**
		Enables the Matter Attractors Plugin.
		
		The attractors plugin that makes it easy to apply continual forces on bodies.
		It's possible to simulate effects such as wind, gravity and magnetism.
		
		https://github.com/liabru/matter-attractors
		
		This method is called automatically if `plugins.attractors` is set in the Matter World Config.
		However, you can also call it directly from within your game.
	**/
	function enableAttractorPlugin():MatterPhysics;
	/**
		Enables the Matter Wrap Plugin.
		
		The coordinate wrapping plugin that automatically wraps the position of bodies such that they always stay
		within the given bounds. Upon crossing a boundary the body will appear on the opposite side of the bounds,
		while maintaining its velocity.
		
		https://github.com/liabru/matter-wrap
		
		This method is called automatically if `plugins.wrap` is set in the Matter World Config.
		However, you can also call it directly from within your game.
	**/
	function enableWrapPlugin():MatterPhysics;
	/**
		Enables the Matter Collision Events Plugin.
		
		Note that this plugin is enabled by default. So you should only ever need to call this
		method if you have specifically disabled the plugin in your Matter World Config.
		You can disable it by setting `plugins.collisionevents: false` in your Matter World Config.
		
		This plugin triggers three new events on Matter.Body:
		
		1. `onCollide`
		2. `onCollideEnd`
		3. `onCollideActive`
		
		These events correspond to the Matter.js events `collisionStart`, `collisionActive` and `collisionEnd`, respectively.
		You can listen to these events via Matter.Events or they will also be emitted from the Matter World.
		
		This plugin also extends Matter.Body with three convenience functions:
		
		`Matter.Body.setOnCollide(callback)`
		`Matter.Body.setOnCollideEnd(callback)`
		`Matter.Body.setOnCollideActive(callback)`
		
		You can register event callbacks by providing a function of type (pair: Matter.Pair) => void
		
		https://github.com/dxu/matter-collision-events
	**/
	function enableCollisionEventsPlugin():MatterPhysics;
	/**
		Pauses the Matter World instance and sets `enabled` to `false`.
		
		A paused world will not run any simulations for the duration it is paused.
	**/
	function pause():World;
	/**
		Resumes this Matter World instance from a paused state and sets `enabled` to `true`.
	**/
	function resume():World;
	/**
		Sets the Matter Engine to run at fixed timestep of 60Hz and enables `autoUpdate`.
		If you have set a custom `getDelta` function then this will override it.
	**/
	function set60Hz():MatterPhysics;
	/**
		Sets the Matter Engine to run at fixed timestep of 30Hz and enables `autoUpdate`.
		If you have set a custom `getDelta` function then this will override it.
	**/
	function set30Hz():MatterPhysics;
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
		Checks if the vertices of the given body, or an array of bodies, contains the given point, or not.
		
		You can pass in either a single body, or an array of bodies to be checked. This method will
		return `true` if _any_ of the bodies in the array contain the point. See the `intersectPoint` method if you need
		to get a list of intersecting bodies.
		
		The point should be transformed into the Matter World coordinate system in advance. This happens by
		default with Input Pointers, but if you wish to use points from another system you may need to
		transform them before passing them.
	**/
	function containsPoint(body:ts.AnyOf6<global.phaser.gameobjects.GameObject, global.matterjs.BodyType, Image, Sprite, TileBody, Array<global.phaser.types.physics.matter.MatterBody>>, x:Float, y:Float):Bool;
	/**
		Checks the given coordinates to see if any vertices of the given bodies contain it.
		
		If no bodies are provided it will search all bodies in the Matter World, including within Composites.
		
		The coordinates should be transformed into the Matter World coordinate system in advance. This happens by
		default with Input Pointers, but if you wish to use coordinates from another system you may need to
		transform them before passing them.
	**/
	function intersectPoint(x:Float, y:Float, ?bodies:Array<global.phaser.types.physics.matter.MatterBody>):Array<global.phaser.types.physics.matter.MatterBody>;
	/**
		Checks the given rectangular area to see if any vertices of the given bodies intersect with it.
		Or, if the `outside` parameter is set to `true`, it checks to see which bodies do not
		intersect with it.
		
		If no bodies are provided it will search all bodies in the Matter World, including within Composites.
	**/
	function intersectRect(x:Float, y:Float, width:Float, height:Float, ?outside:Bool, ?bodies:Array<global.phaser.types.physics.matter.MatterBody>):Array<global.phaser.types.physics.matter.MatterBody>;
	/**
		Checks the given ray segment to see if any vertices of the given bodies intersect with it.
		
		If no bodies are provided it will search all bodies in the Matter World.
		
		The width of the ray can be specified via the `rayWidth` parameter.
	**/
	function intersectRay(x1:Float, y1:Float, x2:Float, y2:Float, ?rayWidth:Float, ?bodies:Array<global.phaser.types.physics.matter.MatterBody>):Array<global.phaser.types.physics.matter.MatterBody>;
	/**
		Checks the given Matter Body to see if it intersects with any of the given bodies.
		
		If no bodies are provided it will check against all bodies in the Matter World.
	**/
	function intersectBody(body:global.phaser.types.physics.matter.MatterBody, ?bodies:Array<global.phaser.types.physics.matter.MatterBody>):Array<global.phaser.types.physics.matter.MatterBody>;
	/**
		Checks to see if the target body, or an array of target bodies, intersects with any of the given bodies.
		
		If intersection occurs this method will return `true` and, if provided, invoke the callbacks.
		
		If no bodies are provided for the second parameter the target will check again all bodies in the Matter World.
		
		Note that bodies can only overlap if they are in non-colliding collision groups or categories.
		
		If you provide a `processCallback` then the two bodies that overlap are sent to it. This callback
		must return a boolean and is used to allow you to perform additional processing tests before a final
		outcome is decided. If it returns `true` then the bodies are finally passed to the `overlapCallback`, if set.
		
		If you provide an `overlapCallback` then the matching pairs of overlapping bodies will be sent to it.
		
		Both callbacks have the following signature: `function (bodyA, bodyB, collisionInfo)` where `bodyA` is always
		the target body. The `collisionInfo` object contains additional data, such as the angle and depth of penetration.
	**/
	function overlap(target:ts.AnyOf6<global.phaser.gameobjects.GameObject, global.matterjs.BodyType, Image, Sprite, TileBody, Array<global.phaser.types.physics.matter.MatterBody>>, ?bodies:Array<global.phaser.types.physics.matter.MatterBody>, ?overlapCallback:global.ArcadePhysicsCallback, ?processCallback:global.ArcadePhysicsCallback, ?callbackContext:Dynamic):Bool;
	/**
		Sets the collision filter category of all given Matter Bodies to the given value.
		
		This number must be a power of two between 2^0 (= 1) and 2^31.
		
		Bodies with different collision groups (see {@link #setCollisionGroup}) will only collide if their collision
		categories are included in their collision masks (see {@link #setCollidesWith}).
	**/
	function setCollisionCategory(bodies:Array<global.phaser.types.physics.matter.MatterBody>, value:Float):MatterPhysics;
	/**
		Sets the collision filter group of all given Matter Bodies to the given value.
		
		If the group value is zero, or if two Matter Bodies have different group values,
		they will collide according to the usual collision filter rules (see {@link #setCollisionCategory} and {@link #setCollisionGroup}).
		
		If two Matter Bodies have the same positive group value, they will always collide;
		if they have the same negative group value they will never collide.
	**/
	function setCollisionGroup(bodies:Array<global.phaser.types.physics.matter.MatterBody>, value:Float):MatterPhysics;
	/**
		Sets the collision filter mask of all given Matter Bodies to the given value.
		
		Two Matter Bodies with different collision groups will only collide if each one includes the others
		category in its mask based on a bitwise AND operation: `(categoryA & maskB) !== 0` and 
		`(categoryB & maskA) !== 0` are both true.
	**/
	function setCollidesWith(bodies:Array<global.phaser.types.physics.matter.MatterBody>, categories:ts.AnyOf2<Float, Array<Float>>):MatterPhysics;
	/**
		Takes an array and returns a new array made from all of the Matter Bodies found in the original array.
		
		For example, passing in Matter Game Objects, such as a bunch of Matter Sprites, to this method, would
		return an array containing all of their native Matter Body objects.
		
		If the `bodies` argument is falsey, it will return all bodies in the world.
	**/
	function getMatterBodies(?bodies:Array<Dynamic>):Array<global.matterjs.BodyType>;
	/**
		Sets both the horizontal and vertical linear velocity of the physics bodies.
	**/
	function setVelocity(bodies:ts.AnyOf6<global.phaser.gameobjects.GameObject, global.matterjs.BodyType, Image, Sprite, TileBody, Array<global.phaser.types.physics.matter.MatterBody>>, x:Float, y:Float):MatterPhysics;
	/**
		Sets just the horizontal linear velocity of the physics bodies.
		The vertical velocity of the body is unchanged.
	**/
	function setVelocityX(bodies:ts.AnyOf6<global.phaser.gameobjects.GameObject, global.matterjs.BodyType, Image, Sprite, TileBody, Array<global.phaser.types.physics.matter.MatterBody>>, x:Float):MatterPhysics;
	/**
		Sets just the vertical linear velocity of the physics bodies.
		The horizontal velocity of the body is unchanged.
	**/
	function setVelocityY(bodies:ts.AnyOf6<global.phaser.gameobjects.GameObject, global.matterjs.BodyType, Image, Sprite, TileBody, Array<global.phaser.types.physics.matter.MatterBody>>, y:Float):MatterPhysics;
	/**
		Sets the angular velocity of the bodies instantly.
		Position, angle, force etc. are unchanged.
	**/
	function setAngularVelocity(bodies:ts.AnyOf6<global.phaser.gameobjects.GameObject, global.matterjs.BodyType, Image, Sprite, TileBody, Array<global.phaser.types.physics.matter.MatterBody>>, value:Float):MatterPhysics;
	/**
		Applies a force to a body, at the bodies current position, including resulting torque.
	**/
	function applyForce(bodies:ts.AnyOf6<global.phaser.gameobjects.GameObject, global.matterjs.BodyType, Image, Sprite, TileBody, Array<global.phaser.types.physics.matter.MatterBody>>, force:global.phaser.types.math.Vector2Like):MatterPhysics;
	/**
		Applies a force to a body, from the given world position, including resulting torque.
		If no angle is given, the current body angle is used.
		
		Use very small speed values, such as 0.1, depending on the mass and required velocity.
	**/
	function applyForceFromPosition(bodies:ts.AnyOf6<global.phaser.gameobjects.GameObject, global.matterjs.BodyType, Image, Sprite, TileBody, Array<global.phaser.types.physics.matter.MatterBody>>, position:global.phaser.types.math.Vector2Like, speed:Float, ?angle:Float):MatterPhysics;
	/**
		Apply a force to a body based on the given angle and speed.
		If no angle is given, the current body angle is used.
		
		Use very small speed values, such as 0.1, depending on the mass and required velocity.
	**/
	function applyForceFromAngle(bodies:ts.AnyOf6<global.phaser.gameobjects.GameObject, global.matterjs.BodyType, Image, Sprite, TileBody, Array<global.phaser.types.physics.matter.MatterBody>>, speed:Float, ?angle:Float):MatterPhysics;
	/**
		Returns the length of the given constraint, which is the distance between the two points.
	**/
	function getConstraintLength(constraint:global.matterjs.ConstraintType):Float;
	/**
		Aligns a Body, or Matter Game Object, against the given coordinates.
		
		The alignment takes place using the body bounds, which take into consideration things
		like body scale and rotation.
		
		Although a Body has a `position` property, it is based on the center of mass for the body,
		not a dimension based center. This makes aligning bodies difficult, especially if they have
		rotated or scaled. This method will derive the correct position based on the body bounds and
		its center of mass offset, in order to align the body with the given coordinate.
		
		For example, if you wanted to align a body so it sat in the bottom-center of the
		Scene, and the world was 800 x 600 in size:
		
		```javascript
		this.matter.alignBody(body, 400, 600, Phaser.Display.Align.BOTTOM_CENTER);
		```
		
		You pass in 400 for the x coordinate, because that is the center of the world, and 600 for
		the y coordinate, as that is the base of the world.
	**/
	function alignBody(body:global.phaser.types.physics.matter.MatterBody, x:Float, y:Float, align:Float):MatterPhysics;
	static var prototype : MatterPhysics;
}