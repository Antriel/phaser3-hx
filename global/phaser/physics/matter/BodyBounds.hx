package global.phaser.physics.matter;

/**
	The Body Bounds class contains methods to help you extract the world coordinates from various points around
	the bounds of a Matter Body. Because Matter bodies are positioned based on their center of mass, and not a
	dimension based center, you often need to get the bounds coordinates in order to properly align them in the world.
	
	You can access this class via the MatterPhysics class from a Scene, i.e.:
	
	```javascript
	this.matter.bodyBounds.getTopLeft(body);
	```
	
	See also the `MatterPhysics.alignBody` method.
**/
@:native("Phaser.Physics.Matter.BodyBounds") extern class BodyBounds {
	function new();
	/**
		A Vector2 that stores the temporary bounds center value during calculations by methods in this class.
	**/
	var boundsCenter : global.phaser.math.Vector2;
	/**
		A Vector2 that stores the temporary center diff values during calculations by methods in this class.
	**/
	var centerDiff : global.phaser.math.Vector2;
	/**
		Parses the given body to get the bounds diff values from it.
		
		They're stored in this class in the temporary properties `boundsCenter` and `centerDiff`.
		
		This method is called automatically by all other methods in this class.
	**/
	function parseBody(body:global.phaser.types.physics.matter.MatterBody):Bool;
	/**
		Takes a Body and returns the world coordinates of the top-left of its _bounds_.
		
		Body bounds are updated by Matter each step and factor in scale and rotation.
		This will return the world coordinate based on the bodies _current_ position and bounds.
	**/
	function getTopLeft(body:global.phaser.types.physics.matter.MatterBody, ?x:Float, ?y:Float):ts.AnyOf2<Bool, global.phaser.math.Vector2>;
	/**
		Takes a Body and returns the world coordinates of the top-center of its _bounds_.
		
		Body bounds are updated by Matter each step and factor in scale and rotation.
		This will return the world coordinate based on the bodies _current_ position and bounds.
	**/
	function getTopCenter(body:global.phaser.types.physics.matter.MatterBody, ?x:Float, ?y:Float):ts.AnyOf2<Bool, global.phaser.math.Vector2>;
	/**
		Takes a Body and returns the world coordinates of the top-right of its _bounds_.
		
		Body bounds are updated by Matter each step and factor in scale and rotation.
		This will return the world coordinate based on the bodies _current_ position and bounds.
	**/
	function getTopRight(body:global.phaser.types.physics.matter.MatterBody, ?x:Float, ?y:Float):ts.AnyOf2<Bool, global.phaser.math.Vector2>;
	/**
		Takes a Body and returns the world coordinates of the left-center of its _bounds_.
		
		Body bounds are updated by Matter each step and factor in scale and rotation.
		This will return the world coordinate based on the bodies _current_ position and bounds.
	**/
	function getLeftCenter(body:global.phaser.types.physics.matter.MatterBody, ?x:Float, ?y:Float):ts.AnyOf2<Bool, global.phaser.math.Vector2>;
	/**
		Takes a Body and returns the world coordinates of the center of its _bounds_.
		
		Body bounds are updated by Matter each step and factor in scale and rotation.
		This will return the world coordinate based on the bodies _current_ position and bounds.
	**/
	function getCenter(body:global.phaser.types.physics.matter.MatterBody, ?x:Float, ?y:Float):ts.AnyOf2<Bool, global.phaser.math.Vector2>;
	/**
		Takes a Body and returns the world coordinates of the right-center of its _bounds_.
		
		Body bounds are updated by Matter each step and factor in scale and rotation.
		This will return the world coordinate based on the bodies _current_ position and bounds.
	**/
	function getRightCenter(body:global.phaser.types.physics.matter.MatterBody, ?x:Float, ?y:Float):ts.AnyOf2<Bool, global.phaser.math.Vector2>;
	/**
		Takes a Body and returns the world coordinates of the bottom-left of its _bounds_.
		
		Body bounds are updated by Matter each step and factor in scale and rotation.
		This will return the world coordinate based on the bodies _current_ position and bounds.
	**/
	function getBottomLeft(body:global.phaser.types.physics.matter.MatterBody, ?x:Float, ?y:Float):ts.AnyOf2<Bool, global.phaser.math.Vector2>;
	/**
		Takes a Body and returns the world coordinates of the bottom-center of its _bounds_.
		
		Body bounds are updated by Matter each step and factor in scale and rotation.
		This will return the world coordinate based on the bodies _current_ position and bounds.
	**/
	function getBottomCenter(body:global.phaser.types.physics.matter.MatterBody, ?x:Float, ?y:Float):ts.AnyOf2<Bool, global.phaser.math.Vector2>;
	/**
		Takes a Body and returns the world coordinates of the bottom-right of its _bounds_.
		
		Body bounds are updated by Matter each step and factor in scale and rotation.
		This will return the world coordinate based on the bodies _current_ position and bounds.
	**/
	function getBottomRight(body:global.phaser.types.physics.matter.MatterBody, ?x:Float, ?y:Float):ts.AnyOf2<Bool, global.phaser.math.Vector2>;
	static var prototype : BodyBounds;
}