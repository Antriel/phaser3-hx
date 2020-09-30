package global.phaser.types.physics.matter;

typedef MatterSetBodyConfig = {
	/**
		The shape type. Either `rectangle`, `circle`, `trapezoid`, `polygon`, `fromVertices`, `fromVerts` or `fromPhysicsEditor`.
	**/
	@:optional
	var type : String;
	/**
		The horizontal world position to place the body at.
	**/
	@:optional
	var x : Float;
	/**
		The vertical world position to place the body at.
	**/
	@:optional
	var y : Float;
	/**
		The width of the body.
	**/
	@:optional
	var width : Float;
	/**
		The height of the body.
	**/
	@:optional
	var height : Float;
	/**
		The radius of the body. Used by `circle` and `polygon` shapes.
	**/
	@:optional
	var radius : Float;
	/**
		The max sizes of the body. Used by the `circle` shape.
	**/
	@:optional
	var maxSides : Float;
	/**
		Used by the `trapezoid` shape. The slope of the trapezoid. 0 creates a rectangle, while 1 creates a triangle. Positive values make the top side shorter, while negative values make the bottom side shorter.
	**/
	@:optional
	var slope : Float;
	/**
		Used by the `polygon` shape. The number of sides the polygon will have.
	**/
	@:optional
	var sides : Float;
	/**
		Used by the `fromVerts` shape. The vertices data. Either a path string or an array of vertices.
	**/
	@:optional
	var verts : ts.AnyOf2<String, Array<Dynamic>>;
	/**
		Used by the `fromVerts` shape. Flag internal edges (coincident part edges)
	**/
	@:optional
	var flagInternal : Bool;
	/**
		Used by the `fromVerts` shape. Whether Matter.js will discard collinear edges (to improve performance).
	**/
	@:optional
	var removeCollinear : Float;
	/**
		Used by the `fromVerts` shape. During decomposition discard parts that have an area less than this.
	**/
	@:optional
	var minimumArea : Float;
	/**
		Should the new body be automatically added to the world?
	**/
	@:optional
	var addToWorld : Bool;
};