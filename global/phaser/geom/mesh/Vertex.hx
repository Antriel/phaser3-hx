package global.phaser.geom.mesh;

/**
	A Vertex Geometry Object.
	
	This class consists of all the information required for a single vertex within a Face Geometry Object.
	
	Faces, and thus Vertex objects, are used by the Mesh Game Object in order to render objects in WebGL.
**/
@:native("Phaser.Geom.Mesh.Vertex") extern class Vertex extends global.phaser.math.Vector3 {
	function new(x:Float, y:Float, z:Float, u:Float, v:Float, ?color:Float, ?alpha:Float, ?nx:Float, ?ny:Float, ?nz:Float);
	/**
		The projected x coordinate of this vertex.
	**/
	var vx : Float;
	/**
		The projected y coordinate of this vertex.
	**/
	var vy : Float;
	/**
		The projected z coordinate of this vertex.
	**/
	var vz : Float;
	/**
		The projected x coordinate of this vertex.
	**/
	var nx : Float;
	/**
		The projected y coordinate of this vertex.
	**/
	var ny : Float;
	/**
		The projected z coordinate of this vertex.
	**/
	var nz : Float;
	/**
		UV u coordinate of this vertex.
	**/
	var u : Float;
	/**
		UV v coordinate of this vertex.
	**/
	var v : Float;
	/**
		The color value of this vertex.
	**/
	var color : Float;
	/**
		The alpha value of this vertex.
	**/
	var alpha : Float;
	/**
		The translated x coordinate of this vertex.
	**/
	var tx : Float;
	/**
		The translated y coordinate of this vertex.
	**/
	var ty : Float;
	/**
		The translated alpha value of this vertex.
	**/
	var ta : Float;
	/**
		Sets the U and V properties.
	**/
	function setUVs(u:Float, v:Float):Vertex;
	/**
		Transforms this vertex by the given matrix, storing the results in `vx`, `vy` and `vz`.
	**/
	function transformCoordinatesLocal(transformMatrix:global.phaser.math.Matrix4, width:Float, height:Float, cameraZ:Float):Void;
	/**
		Updates this Vertex based on the given transform.
	**/
	function update(a:Float, b:Float, c:Float, d:Float, e:Float, f:Float, roundPixels:Bool, alpha:Float):Vertex;
	/**
		Loads the data from this Vertex into the given Typed Arrays.
	**/
	function load(F32:js.lib.Float32Array, U32:js.lib.Uint32Array, offset:Float, textureUnit:Float):Float;
	static var prototype : Vertex;
}