package global.phaser.renderer.webgl.pipelines;

/**
	Implements a model view projection matrices.
	Pipelines can implement this for doing 2D and 3D rendering.
**/
typedef ModelViewProjection = {
	/**
		Dirty flag for checking if model matrix needs to be updated on GPU.
	**/
	var modelMatrixDirty : Bool;
	/**
		Dirty flag for checking if view matrix needs to be updated on GPU.
	**/
	var viewMatrixDirty : Bool;
	/**
		Dirty flag for checking if projection matrix needs to be updated on GPU.
	**/
	var projectionMatrixDirty : Bool;
	/**
		Model matrix
	**/
	var modelMatrix : js.lib.Float32Array;
	/**
		View matrix
	**/
	var viewMatrix : js.lib.Float32Array;
	/**
		Projection matrix
	**/
	var projectionMatrix : js.lib.Float32Array;
	/**
		Initializes MVP matrices with an identity matrix
	**/
	function mvpInit():Void;
	/**
		If dirty flags are set then the matrices are uploaded to the GPU.
	**/
	function mvpUpdate():Void;
	/**
		Loads an identity matrix to the model matrix
	**/
	function modelIdentity():Void;
	/**
		Scale model matrix
	**/
	function modelScale(x:Float, y:Float, z:Float):ModelViewProjection;
	/**
		Translate model matrix
	**/
	function modelTranslate(x:Float, y:Float, z:Float):ModelViewProjection;
	/**
		Rotates the model matrix in the X axis.
	**/
	function modelRotateX(radians:Float):ModelViewProjection;
	/**
		Rotates the model matrix in the Y axis.
	**/
	function modelRotateY(radians:Float):ModelViewProjection;
	/**
		Rotates the model matrix in the Z axis.
	**/
	function modelRotateZ(radians:Float):ModelViewProjection;
	/**
		Loads identity matrix into the view matrix
	**/
	function viewIdentity():ModelViewProjection;
	/**
		Scales view matrix
	**/
	function viewScale(x:Float, y:Float, z:Float):ModelViewProjection;
	/**
		Translates view matrix
	**/
	function viewTranslate(x:Float, y:Float, z:Float):ModelViewProjection;
	/**
		Rotates view matrix in the X axis.
	**/
	function viewRotateX(radians:Float):ModelViewProjection;
	/**
		Rotates view matrix in the Y axis.
	**/
	function viewRotateY(radians:Float):ModelViewProjection;
	/**
		Rotates view matrix in the Z axis.
	**/
	function viewRotateZ(radians:Float):ModelViewProjection;
	/**
		Loads a 2D view matrix (3x2 matrix) into a 4x4 view matrix
	**/
	function viewLoad2D(matrix2D:js.lib.Float32Array):ModelViewProjection;
	/**
		Copies a 4x4 matrix into the view matrix
	**/
	function viewLoad(matrix:js.lib.Float32Array):ModelViewProjection;
	/**
		Loads identity matrix into the projection matrix.
	**/
	function projIdentity():ModelViewProjection;
	/**
		Sets up an orthographic projection matrix
	**/
	function projOrtho(left:Float, right:Float, bottom:Float, top:Float, near:Float, far:Float):ModelViewProjection;
	/**
		Sets up a perspective projection matrix
	**/
	function projPersp(fovY:Float, aspectRatio:Float, near:Float, far:Float):ModelViewProjection;
};