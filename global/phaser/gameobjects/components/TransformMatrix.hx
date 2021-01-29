package global.phaser.gameobjects.components;

/**
	A Matrix used for display transformations for rendering.
	
	It is represented like so:
	
	```
	| a | c | tx |
	| b | d | ty |
	| 0 | 0 | 1  |
	```
**/
@:native("Phaser.GameObjects.Components.TransformMatrix") extern class TransformMatrix {
	function new(?a:Float, ?b:Float, ?c:Float, ?d:Float, ?tx:Float, ?ty:Float);
	/**
		The matrix values.
	**/
	var matrix : js.lib.Float32Array;
	/**
		The decomposed matrix.
	**/
	var decomposedMatrix : Dynamic;
	/**
		The Scale X value.
	**/
	var a : Float;
	/**
		The Skew Y value.
	**/
	var b : Float;
	/**
		The Skew X value.
	**/
	var c : Float;
	/**
		The Scale Y value.
	**/
	var d : Float;
	/**
		The Translate X value.
	**/
	var e : Float;
	/**
		The Translate Y value.
	**/
	var f : Float;
	/**
		The Translate X value.
	**/
	var tx : Float;
	/**
		The Translate Y value.
	**/
	var ty : Float;
	/**
		The rotation of the Matrix. Value is in radians.
	**/
	final rotation : Float;
	/**
		The rotation of the Matrix, normalized to be within the Phaser right-handed
		clockwise rotation space. Value is in radians.
	**/
	final rotationNormalized : Float;
	/**
		The decomposed horizontal scale of the Matrix. This value is always positive.
	**/
	final scaleX : Float;
	/**
		The decomposed vertical scale of the Matrix. This value is always positive.
	**/
	final scaleY : Float;
	/**
		Reset the Matrix to an identity matrix.
	**/
	function loadIdentity():TransformMatrix;
	/**
		Translate the Matrix.
	**/
	function translate(x:Float, y:Float):TransformMatrix;
	/**
		Scale the Matrix.
	**/
	function scale(x:Float, y:Float):TransformMatrix;
	/**
		Rotate the Matrix.
	**/
	function rotate(angle:Float):TransformMatrix;
	/**
		Multiply this Matrix by the given Matrix.
		
		If an `out` Matrix is given then the results will be stored in it.
		If it is not given, this matrix will be updated in place instead.
		Use an `out` Matrix if you do not wish to mutate this matrix.
	**/
	function multiply(rhs:TransformMatrix, ?out:TransformMatrix):TransformMatrix;
	/**
		Multiply this Matrix by the matrix given, including the offset.
		
		The offsetX is added to the tx value: `offsetX * a + offsetY * c + tx`.
		The offsetY is added to the ty value: `offsetY * b + offsetY * d + ty`.
	**/
	function multiplyWithOffset(src:TransformMatrix, offsetX:Float, offsetY:Float):TransformMatrix;
	/**
		Transform the Matrix.
	**/
	function transform(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):TransformMatrix;
	/**
		Transform a point using this Matrix.
	**/
	function transformPoint(x:Float, y:Float, point:ts.AnyOf3<Dynamic, global.phaser.math.Vector2, global.phaser.geom.Point>):ts.AnyOf3<Dynamic, global.phaser.math.Vector2, global.phaser.geom.Point>;
	/**
		Invert the Matrix.
	**/
	function invert():TransformMatrix;
	/**
		Set the values of this Matrix to copy those of the matrix given.
	**/
	function copyFrom(src:TransformMatrix):TransformMatrix;
	/**
		Set the values of this Matrix to copy those of the array given.
		Where array indexes 0, 1, 2, 3, 4 and 5 are mapped to a, b, c, d, e and f.
	**/
	function copyFromArray(src:Array<Dynamic>):TransformMatrix;
	/**
		Copy the values from this Matrix to the given Canvas Rendering Context.
		This will use the Context.transform method.
	**/
	function copyToContext(ctx:js.html.CanvasRenderingContext2D):js.html.CanvasRenderingContext2D;
	/**
		Copy the values from this Matrix to the given Canvas Rendering Context.
		This will use the Context.setTransform method.
	**/
	function setToContext(ctx:js.html.CanvasRenderingContext2D):js.html.CanvasRenderingContext2D;
	/**
		Copy the values in this Matrix to the array given.
		
		Where array indexes 0, 1, 2, 3, 4 and 5 are mapped to a, b, c, d, e and f.
	**/
	function copyToArray(?out:Array<Dynamic>):Array<Dynamic>;
	/**
		Set the values of this Matrix.
	**/
	function setTransform(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):TransformMatrix;
	/**
		Decompose this Matrix into its translation, scale and rotation values using QR decomposition.
		
		The result must be applied in the following order to reproduce the current matrix:
		
		translate -> rotate -> scale
	**/
	function decomposeMatrix():Dynamic;
	/**
		Apply the identity, translate, rotate and scale operations on the Matrix.
	**/
	function applyITRS(x:Float, y:Float, rotation:Float, scaleX:Float, scaleY:Float):TransformMatrix;
	/**
		Takes the `x` and `y` values and returns a new position in the `output` vector that is the inverse of
		the current matrix with its transformation applied.
		
		Can be used to translate points from world to local space.
	**/
	function applyInverse(x:Float, y:Float, ?output:global.phaser.math.Vector2):global.phaser.math.Vector2;
	/**
		Returns the X component of this matrix multiplied by the given values.
		This is the same as `x * a + y * c + e`.
	**/
	function getX(x:Float, y:Float):Float;
	/**
		Returns the Y component of this matrix multiplied by the given values.
		This is the same as `x * b + y * d + f`.
	**/
	function getY(x:Float, y:Float):Float;
	/**
		Returns the X component of this matrix multiplied by the given values.
		
		This is the same as `x * a + y * c + e`, optionally passing via `Math.round`.
	**/
	function getXRound(x:Float, y:Float, ?round:Bool):Float;
	/**
		Returns the Y component of this matrix multiplied by the given values.
		
		This is the same as `x * b + y * d + f`, optionally passing via `Math.round`.
	**/
	function getYRound(x:Float, y:Float, ?round:Bool):Float;
	/**
		Returns a string that can be used in a CSS Transform call as a `matrix` property.
	**/
	function getCSSMatrix():String;
	/**
		Destroys this Transform Matrix.
	**/
	function destroy():Void;
	static var prototype : TransformMatrix;
}