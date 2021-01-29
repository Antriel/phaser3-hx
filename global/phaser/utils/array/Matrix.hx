package global.phaser.utils.array;

@:native("Phaser.Utils.Array.Matrix") @valueModuleOnly extern class Matrix {
	/**
		Checks if an array can be used as a matrix.
		
		A matrix is a two-dimensional array (array of arrays), where all sub-arrays (rows)
		have the same length. There must be at least two rows. This is an example matrix:
		
		```
		[
		    [ 1, 1, 1, 1, 1, 1 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 2, 0, 1, 2, 0, 4 ],
		    [ 2, 0, 3, 4, 0, 4 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 3, 3, 3, 3, 3, 3 ]
		]
		```
	**/
	static function CheckMatrix<T>(?matrix:Array<Array<T>>):Bool;
	/**
		Generates a string (which you can pass to console.log) from the given Array Matrix.
		
		A matrix is a two-dimensional array (array of arrays), where all sub-arrays (rows)
		have the same length. There must be at least two rows. This is an example matrix:
		
		```
		[
		    [ 1, 1, 1, 1, 1, 1 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 2, 0, 1, 2, 0, 4 ],
		    [ 2, 0, 3, 4, 0, 4 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 3, 3, 3, 3, 3, 3 ]
		]
		```
	**/
	static function MatrixToString<T>(?matrix:Array<Array<T>>):String;
	/**
		Reverses the columns in the given Array Matrix.
		
		A matrix is a two-dimensional array (array of arrays), where all sub-arrays (rows)
		have the same length. There must be at least two rows. This is an example matrix:
		
		```
		[
		    [ 1, 1, 1, 1, 1, 1 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 2, 0, 1, 2, 0, 4 ],
		    [ 2, 0, 3, 4, 0, 4 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 3, 3, 3, 3, 3, 3 ]
		]
		```
	**/
	static function ReverseColumns<T>(?matrix:Array<Array<T>>):Array<Array<T>>;
	/**
		Reverses the rows in the given Array Matrix.
		
		A matrix is a two-dimensional array (array of arrays), where all sub-arrays (rows)
		have the same length. There must be at least two rows. This is an example matrix:
		
		```
		[
		    [ 1, 1, 1, 1, 1, 1 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 2, 0, 1, 2, 0, 4 ],
		    [ 2, 0, 3, 4, 0, 4 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 3, 3, 3, 3, 3, 3 ]
		]
		```
	**/
	static function ReverseRows<T>(?matrix:Array<Array<T>>):Array<Array<T>>;
	/**
		Rotates the array matrix 180 degrees.
		
		A matrix is a two-dimensional array (array of arrays), where all sub-arrays (rows)
		have the same length. There must be at least two rows. This is an example matrix:
		
		```
		[
		    [ 1, 1, 1, 1, 1, 1 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 2, 0, 1, 2, 0, 4 ],
		    [ 2, 0, 3, 4, 0, 4 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 3, 3, 3, 3, 3, 3 ]
		]
		```
	**/
	static function Rotate180<T>(?matrix:Array<Array<T>>):Array<Array<T>>;
	/**
		Rotates the array matrix to the left (or 90 degrees)
		
		A matrix is a two-dimensional array (array of arrays), where all sub-arrays (rows)
		have the same length. There must be at least two rows. This is an example matrix:
		
		```
		[
		    [ 1, 1, 1, 1, 1, 1 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 2, 0, 1, 2, 0, 4 ],
		    [ 2, 0, 3, 4, 0, 4 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 3, 3, 3, 3, 3, 3 ]
		]
		```
	**/
	static function RotateLeft<T>(?matrix:Array<Array<T>>):Array<Array<T>>;
	/**
		Rotates the array matrix based on the given rotation value.
		
		The value can be given in degrees: 90, -90, 270, -270 or 180,
		or a string command: `rotateLeft`, `rotateRight` or `rotate180`.
		
		Based on the routine from {@link http://jsfiddle.net/MrPolywhirl/NH42z/}.
		
		A matrix is a two-dimensional array (array of arrays), where all sub-arrays (rows)
		have the same length. There must be at least two rows. This is an example matrix:
		
		```
		[
		    [ 1, 1, 1, 1, 1, 1 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 2, 0, 1, 2, 0, 4 ],
		    [ 2, 0, 3, 4, 0, 4 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 3, 3, 3, 3, 3, 3 ]
		]
		```
	**/
	static function RotateMatrix<T>(?matrix:Array<Array<T>>, ?direction:ts.AnyOf2<String, Float>):Array<Array<T>>;
	/**
		Rotates the array matrix to the left (or -90 degrees)
		
		A matrix is a two-dimensional array (array of arrays), where all sub-arrays (rows)
		have the same length. There must be at least two rows. This is an example matrix:
		
		```
		[
		    [ 1, 1, 1, 1, 1, 1 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 2, 0, 1, 2, 0, 4 ],
		    [ 2, 0, 3, 4, 0, 4 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 3, 3, 3, 3, 3, 3 ]
		]
		```
	**/
	static function RotateRight<T>(?matrix:Array<Array<T>>):Array<Array<T>>;
	/**
		Translates the given Array Matrix by shifting each column and row the
		amount specified.
		
		A matrix is a two-dimensional array (array of arrays), where all sub-arrays (rows)
		have the same length. There must be at least two rows. This is an example matrix:
		
		```
		[
		    [ 1, 1, 1, 1, 1, 1 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 2, 0, 1, 2, 0, 4 ],
		    [ 2, 0, 3, 4, 0, 4 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 3, 3, 3, 3, 3, 3 ]
		]
		```
	**/
	static function Translate<T>(?matrix:Array<Array<T>>, ?x:Float, ?y:Float):Array<Array<T>>;
	/**
		Transposes the elements of the given matrix (array of arrays).
		
		The transpose of a matrix is a new matrix whose rows are the columns of the original.
		
		A matrix is a two-dimensional array (array of arrays), where all sub-arrays (rows)
		have the same length. There must be at least two rows. This is an example matrix:
		
		```
		[
		    [ 1, 1, 1, 1, 1, 1 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 2, 0, 1, 2, 0, 4 ],
		    [ 2, 0, 3, 4, 0, 4 ],
		    [ 2, 0, 0, 0, 0, 4 ],
		    [ 3, 3, 3, 3, 3, 3 ]
		]
		```
	**/
	static function TransposeMatrix<T>(?array:Array<Array<T>>):Array<Array<T>>;
}