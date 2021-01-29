package global.phaser.geom.mesh;

/**
	A Face Geometry Object.
	
	A Face is used by the Mesh Game Object. A Mesh consists of one, or more, faces that are
	used to render the Mesh Game Objects in WebGL.
	
	A Face consists of 3 Vertex instances, for the 3 corners of the face and methods to help
	you modify and test them.
**/
@:native("Phaser.Geom.Mesh.Face") extern class Face {
	function new(vertex1:Vertex, vertex2:Vertex, vertex3:Vertex);
	/**
		The first vertex in this Face.
	**/
	var vertex1 : Vertex;
	/**
		The second vertex in this Face.
	**/
	var vertex2 : Vertex;
	/**
		The third vertex in this Face.
	**/
	var vertex3 : Vertex;
	/**
		The bounds of this Face.
		
		Be sure to call the `Face.updateBounds` method _before_ using this property.
	**/
	var bounds : global.phaser.geom.Rectangle;
	/**
		Calculates and returns the in-center position of this Face.
	**/
	function getInCenter(?local:Bool):global.phaser.math.Vector2;
	/**
		Checks if the given coordinates are within this Face.
		
		You can optionally provide a transform matrix. If given, the Face vertices
		will be transformed first, before being checked against the coordinates.
	**/
	function contains(x:Float, y:Float, ?calcMatrix:global.phaser.gameobjects.components.TransformMatrix):Bool;
	/**
		Checks if the vertices in this Face are orientated counter-clockwise, or not.
		
		It checks the transformed position of the vertices, not the local one.
	**/
	function isCounterClockwise(z:Float):Bool;
	/**
		Loads the data from this Vertex into the given Typed Arrays.
	**/
	function load(F32:js.lib.Float32Array, U32:js.lib.Uint32Array, offset:Float, textureUnit:Float, alpha:Float, a:Float, b:Float, c:Float, d:Float, e:Float, f:Float, roundPixels:Bool):Float;
	/**
		Transforms all Face vertices by the given matrix, storing the results in their `vx`, `vy` and `vz` properties.
	**/
	function transformCoordinatesLocal(transformMatrix:global.phaser.math.Matrix4, width:Float, height:Float, cameraZ:Float):Face;
	/**
		Updates the bounds of this Face, based on the translated values of the vertices.
		
		Call this method prior to accessing the `Face.bounds` property.
	**/
	function updateBounds():Face;
	/**
		Checks if this Face is within the view of the given Camera.
		
		This method is called in the `MeshWebGLRenderer` function. It performs the following tasks:
		
		First, the `Vertex.update` method is called on each of the vertices. This populates them
		with the new translated values, updating their `tx`, `ty` and `ta` properties.
		
		Then it tests to see if this face is visible due to the alpha values, if not, it returns.
		
		After this, if `hideCCW` is set, it calls `isCounterClockwise` and returns if not.
		
		Finally, it will update the `Face.bounds` based on the newly translated vertex values
		and return the results of an intersection test between the bounds and the camera world view
		rectangle.
	**/
	function isInView(camera:global.phaser.cameras.scene2d.Camera, hideCCW:Bool, z:Float, alpha:Float, a:Float, b:Float, c:Float, d:Float, e:Float, f:Float, roundPixels:Bool):Bool;
	/**
		Translates the vertices of this Face by the given amounts.
		
		The actual vertex positions are adjusted, not their transformed position.
		
		Therefore, this updates the vertex data directly.
	**/
	function translate(x:Float, ?y:Float):Face;
	/**
		The x coordinate of this Face, based on the in center position of the Face.
	**/
	var x : Float;
	/**
		The y coordinate of this Face, based on the in center position of the Face.
	**/
	var y : Float;
	/**
		Set the alpha value of this Face.
		
		Each vertex is given the same value. If you need to adjust the alpha on a per-vertex basis
		then use the `Vertex.alpha` property instead.
		
		When getting the alpha of this Face, it will return an average of the alpha
		component of all three vertices.
	**/
	var alpha : Float;
	/**
		The depth of this Face, which is an average of the z component of all three vertices.
		
		The depth is calculated based on the transformed z value, not the local one.
	**/
	final depth : Float;
	/**
		Destroys this Face and nulls the references to the vertices.
	**/
	function destroy():Void;
	static var prototype : Face;
}