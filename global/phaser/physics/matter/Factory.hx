package global.phaser.physics.matter;

/**
	The Matter Factory is responsible for quickly creating a variety of different types of
	bodies, constraints and Game Objects and adding them into the physics world.
	
	You access the factory from within a Scene using `add`:
	
	```javascript
	this.matter.add.rectangle(x, y, width, height);
	```
	
	Use of the Factory is optional. All of the objects it creates can also be created
	directly via your own code or constructors. It is provided as a means to keep your
	code concise.
**/
@:native("Phaser.Physics.Matter.Factory") extern class Factory {
	function new(world:World);
	/**
		The Matter World which this Factory adds to.
	**/
	var world : World;
	/**
		The Scene which this Factory's Matter World belongs to.
	**/
	var scene : global.phaser.Scene;
	/**
		A reference to the Scene.Systems this Matter Physics instance belongs to.
	**/
	var sys : global.phaser.scenes.Systems;
	/**
		Creates a new rigid rectangular Body and adds it to the World.
	**/
	function rectangle(x:Float, y:Float, width:Float, height:Float, ?options:global.phaser.types.physics.matter.MatterBodyConfig):global.matterjs.BodyType;
	/**
		Creates a new rigid trapezoidal Body and adds it to the World.
	**/
	function trapezoid(x:Float, y:Float, width:Float, height:Float, slope:Float, ?options:global.phaser.types.physics.matter.MatterBodyConfig):global.matterjs.BodyType;
	/**
		Creates a new rigid circular Body and adds it to the World.
	**/
	function circle(x:Float, y:Float, radius:Float, ?options:global.phaser.types.physics.matter.MatterBodyConfig, ?maxSides:Float):global.matterjs.BodyType;
	/**
		Creates a new rigid polygonal Body and adds it to the World.
	**/
	function polygon(x:Float, y:Float, sides:Float, radius:Float, ?options:global.phaser.types.physics.matter.MatterBodyConfig):global.matterjs.BodyType;
	/**
		Creates a body using the supplied vertices (or an array containing multiple sets of vertices) and adds it to the World.
		If the vertices are convex, they will pass through as supplied. Otherwise, if the vertices are concave, they will be decomposed. Note that this process is not guaranteed to support complex sets of vertices, e.g. ones with holes.
	**/
	function fromVertices(x:Float, y:Float, vertexSets:ts.AnyOf2<String, Array<Dynamic>>, ?options:global.phaser.types.physics.matter.MatterBodyConfig, ?flagInternal:Bool, ?removeCollinear:Float, ?minimumArea:Float):global.matterjs.BodyType;
	/**
		Creates a body using data exported from the application PhysicsEditor (https://www.codeandweb.com/physicseditor)
		
		The PhysicsEditor file should be loaded as JSON:
		
		```javascript
		preload ()
		{
		   this.load.json('vehicles', 'assets/vehicles.json);
		}
		
		create ()
		{
		   const vehicleShapes = this.cache.json.get('vehicles');
		   this.matter.add.fromPhysicsEditor(400, 300, vehicleShapes.truck);
		}
		```
		
		Do not pass the entire JSON file to this method, but instead pass one of the shapes contained within it.
		
		If you pas in an `options` object, any settings in there will override those in the PhysicsEditor config object.
	**/
	function fromPhysicsEditor(x:Float, y:Float, config:Dynamic, ?options:global.phaser.types.physics.matter.MatterBodyConfig, ?addToWorld:Bool):global.matterjs.BodyType;
	/**
		Creates a body using the path data from an SVG file.
		
		SVG Parsing requires the pathseg polyfill from https://github.com/progers/pathseg
		
		The SVG file should be loaded as XML, as this method requires the ability to extract
		the path data from it. I.e.:
		
		```javascript
		preload ()
		{
		   this.load.xml('face', 'assets/face.svg);
		}
		
		create ()
		{
		   this.matter.add.fromSVG(400, 300, this.cache.xml.get('face'));
		}
		```
	**/
	function fromSVG(x:Float, y:Float, xml:Dynamic, ?scale:Float, ?options:global.phaser.types.physics.matter.MatterBodyConfig, ?addToWorld:Bool):global.matterjs.BodyType;
	/**
		Creates a body using the supplied physics data, as provided by a JSON file.
		
		The data file should be loaded as JSON:
		
		```javascript
		preload ()
		{
		   this.load.json('ninjas', 'assets/ninjas.json);
		}
		
		create ()
		{
		   const ninjaShapes = this.cache.json.get('ninjas');
		
		   this.matter.add.fromJSON(400, 300, ninjaShapes.shinobi);
		}
		```
		
		Do not pass the entire JSON file to this method, but instead pass one of the shapes contained within it.
		
		If you pas in an `options` object, any settings in there will override those in the config object.
		
		The structure of the JSON file is as follows:
		
		```text
		{
		   'generator_info': // The name of the application that created the JSON data
		   'shapeName': {
		     'type': // The type of body
		     'label': // Optional body label
		     'vertices': // An array, or an array of arrays, containing the vertex data in x/y object pairs
		   }
		}
		```
		
		At the time of writing, only the Phaser Physics Tracer App exports in this format.
	**/
	function fromJSON(x:Float, y:Float, config:Dynamic, ?options:global.phaser.types.physics.matter.MatterBodyConfig, ?addToWorld:Bool):global.matterjs.BodyType;
	/**
		Create a new composite containing Matter Image objects created in a grid arrangement.
		This function uses the body bounds to prevent overlaps.
	**/
	function imageStack(key:String, frame:ts.AnyOf2<String, Float>, x:Float, y:Float, columns:Float, rows:Float, ?columnGap:Float, ?rowGap:Float, ?options:global.phaser.types.physics.matter.MatterBodyConfig):global.matterjs.CompositeType;
	/**
		Create a new composite containing bodies created in the callback in a grid arrangement.
		
		This function uses the body bounds to prevent overlaps.
	**/
	function stack(x:Float, y:Float, columns:Float, rows:Float, columnGap:Float, rowGap:Float, callback:haxe.Constraints.Function):global.matterjs.CompositeType;
	/**
		Create a new composite containing bodies created in the callback in a pyramid arrangement.
		This function uses the body bounds to prevent overlaps.
	**/
	function pyramid(x:Float, y:Float, columns:Float, rows:Float, columnGap:Float, rowGap:Float, callback:haxe.Constraints.Function):global.matterjs.CompositeType;
	/**
		Chains all bodies in the given composite together using constraints.
	**/
	function chain(composite:global.matterjs.CompositeType, xOffsetA:Float, yOffsetA:Float, xOffsetB:Float, yOffsetB:Float, ?options:global.phaser.types.physics.matter.MatterConstraintConfig):global.matterjs.CompositeType;
	/**
		Connects bodies in the composite with constraints in a grid pattern, with optional cross braces.
	**/
	function mesh(composite:global.matterjs.CompositeType, columns:Float, rows:Float, crossBrace:Bool, ?options:global.phaser.types.physics.matter.MatterConstraintConfig):global.matterjs.CompositeType;
	/**
		Creates a composite with a Newton's Cradle setup of bodies and constraints.
	**/
	function newtonsCradle(x:Float, y:Float, number:Float, size:Float, length:Float):global.matterjs.CompositeType;
	/**
		Creates a composite with simple car setup of bodies and constraints.
	**/
	function car(x:Float, y:Float, width:Float, height:Float, wheelSize:Float):global.matterjs.CompositeType;
	/**
		Creates a simple soft body like object.
	**/
	function softBody(x:Float, y:Float, columns:Float, rows:Float, columnGap:Float, rowGap:Float, crossBrace:Bool, particleRadius:Float, ?particleOptions:global.phaser.types.physics.matter.MatterBodyConfig, ?constraintOptions:global.phaser.types.physics.matter.MatterConstraintConfig):global.matterjs.CompositeType;
	/**
		This method is an alias for `Factory.constraint`.
		
		Constraints (or joints) are used for specifying that a fixed distance must be maintained
		between two bodies, or a body and a fixed world-space position.
		
		The stiffness of constraints can be modified to create springs or elastic.
		
		To simulate a revolute constraint (or pin joint) set `length: 0` and a high `stiffness`
		value (e.g. `0.7` or above).
		
		If the constraint is unstable, try lowering the `stiffness` value and / or increasing
		`constraintIterations` within the Matter Config.
		
		For compound bodies, constraints must be applied to the parent body and not one of its parts.
	**/
	function joint(bodyA:global.matterjs.BodyType, bodyB:global.matterjs.BodyType, ?length:Float, ?stiffness:Float, ?options:global.phaser.types.physics.matter.MatterConstraintConfig):global.matterjs.ConstraintType;
	/**
		This method is an alias for `Factory.constraint`.
		
		Constraints (or joints) are used for specifying that a fixed distance must be maintained
		between two bodies, or a body and a fixed world-space position.
		
		The stiffness of constraints can be modified to create springs or elastic.
		
		To simulate a revolute constraint (or pin joint) set `length: 0` and a high `stiffness`
		value (e.g. `0.7` or above).
		
		If the constraint is unstable, try lowering the `stiffness` value and / or increasing
		`constraintIterations` within the Matter Config.
		
		For compound bodies, constraints must be applied to the parent body and not one of its parts.
	**/
	function spring(bodyA:global.matterjs.BodyType, bodyB:global.matterjs.BodyType, ?length:Float, ?stiffness:Float, ?options:global.phaser.types.physics.matter.MatterConstraintConfig):global.matterjs.ConstraintType;
	/**
		Constraints (or joints) are used for specifying that a fixed distance must be maintained
		between two bodies, or a body and a fixed world-space position.
		
		The stiffness of constraints can be modified to create springs or elastic.
		
		To simulate a revolute constraint (or pin joint) set `length: 0` and a high `stiffness`
		value (e.g. `0.7` or above).
		
		If the constraint is unstable, try lowering the `stiffness` value and / or increasing
		`constraintIterations` within the Matter Config.
		
		For compound bodies, constraints must be applied to the parent body and not one of its parts.
	**/
	function constraint(bodyA:global.matterjs.BodyType, bodyB:global.matterjs.BodyType, ?length:Float, ?stiffness:Float, ?options:global.phaser.types.physics.matter.MatterConstraintConfig):global.matterjs.ConstraintType;
	/**
		Constraints (or joints) are used for specifying that a fixed distance must be maintained
		between two bodies, or a body and a fixed world-space position.
		
		A world constraint has only one body, you should specify a `pointA` position in
		the constraint options parameter to attach the constraint to the world.
		
		The stiffness of constraints can be modified to create springs or elastic.
		
		To simulate a revolute constraint (or pin joint) set `length: 0` and a high `stiffness`
		value (e.g. `0.7` or above).
		
		If the constraint is unstable, try lowering the `stiffness` value and / or increasing
		`constraintIterations` within the Matter Config.
		
		For compound bodies, constraints must be applied to the parent body and not one of its parts.
	**/
	function worldConstraint(body:global.matterjs.BodyType, ?length:Float, ?stiffness:Float, ?options:global.phaser.types.physics.matter.MatterConstraintConfig):global.matterjs.ConstraintType;
	/**
		This method is an alias for `Factory.pointerConstraint`.
		
		A Pointer Constraint is a special type of constraint that allows you to click
		and drag bodies in a Matter World. It monitors the active Pointers in a Scene,
		and when one is pressed down it checks to see if that hit any part of any active
		body in the world. If it did, and the body has input enabled, it will begin to
		drag it until either released, or you stop it via the `stopDrag` method.
		
		You can adjust the stiffness, length and other properties of the constraint via
		the `options` object on creation.
	**/
	function mouseSpring(?options:global.phaser.types.physics.matter.MatterConstraintConfig):global.matterjs.ConstraintType;
	/**
		A Pointer Constraint is a special type of constraint that allows you to click
		and drag bodies in a Matter World. It monitors the active Pointers in a Scene,
		and when one is pressed down it checks to see if that hit any part of any active
		body in the world. If it did, and the body has input enabled, it will begin to
		drag it until either released, or you stop it via the `stopDrag` method.
		
		You can adjust the stiffness, length and other properties of the constraint via
		the `options` object on creation.
	**/
	function pointerConstraint(?options:global.phaser.types.physics.matter.MatterConstraintConfig):global.matterjs.ConstraintType;
	/**
		Creates a Matter Physics Image Game Object.
		
		An Image is a light-weight Game Object useful for the display of static images in your game,
		such as logos, backgrounds, scenery or other non-animated elements. Images can have input
		events and physics bodies, or be tweened, tinted or scrolled. The main difference between an
		Image and a Sprite is that you cannot animate an Image as they do not have the Animation component.
	**/
	function image(x:Float, y:Float, key:String, ?frame:ts.AnyOf2<String, Float>, ?options:global.phaser.types.physics.matter.MatterBodyConfig):Image;
	/**
		Creates a wrapper around a Tile that provides access to a corresponding Matter body. A tile can only
		have one Matter body associated with it. You can either pass in an existing Matter body for
		the tile or allow the constructor to create the corresponding body for you. If the Tile has a
		collision group (defined in Tiled), those shapes will be used to create the body. If not, the
		tile's rectangle bounding box will be used.
		
		The corresponding body will be accessible on the Tile itself via Tile.physics.matterBody.
		
		Note: not all Tiled collision shapes are supported. See
		Phaser.Physics.Matter.TileBody#setFromTileCollision for more information.
	**/
	function tileBody(tile:global.phaser.tilemaps.Tile, ?options:global.phaser.types.physics.matter.MatterTileOptions):TileBody;
	/**
		Creates a Matter Physics Sprite Game Object.
		
		A Sprite Game Object is used for the display of both static and animated images in your game.
		Sprites can have input events and physics bodies. They can also be tweened, tinted, scrolled
		and animated.
		
		The main difference between a Sprite and an Image Game Object is that you cannot animate Images.
		As such, Sprites take a fraction longer to process and have a larger API footprint due to the Animation
		Component. If you do not require animation then you can safely use Images to replace Sprites in all cases.
	**/
	function sprite(x:Float, y:Float, key:String, ?frame:ts.AnyOf2<String, Float>, ?options:global.phaser.types.physics.matter.MatterBodyConfig):Sprite;
	/**
		Takes an existing Game Object and injects all of the Matter Components into it.
		
		This enables you to use component methods such as `setVelocity` or `isSensor` directly from
		this Game Object.
		
		You can also pass in either a Matter Body Configuration object, or a Matter Body instance
		to link with this Game Object.
	**/
	function gameObject(gameObject:global.phaser.gameobjects.GameObject, ?options:ts.AnyOf2<global.phaser.types.physics.matter.MatterBodyConfig, global.matterjs.Body>, ?addToWorld:Bool):global.phaser.gameobjects.GameObject;
	/**
		Destroys this Factory.
	**/
	function destroy():Void;
	static var prototype : Factory;
}