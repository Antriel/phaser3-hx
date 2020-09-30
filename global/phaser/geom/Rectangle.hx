package global.phaser.geom;

/**
	Encapsulates a 2D rectangle defined by its corner point in the top-left and its extends in x (width) and y (height)
**/
@:native("Phaser.Geom.Rectangle") extern class Rectangle {
	function new(?x:Float, ?y:Float, ?width:Float, ?height:Float);
	/**
		The geometry constant type of this object: `GEOM_CONST.RECTANGLE`.
		Used for fast type comparisons.
	**/
	final type : Float;
	/**
		The X coordinate of the top left corner of the Rectangle.
	**/
	var x : Float;
	/**
		The Y coordinate of the top left corner of the Rectangle.
	**/
	var y : Float;
	/**
		The width of the Rectangle, i.e. the distance between its left side (defined by `x`) and its right side.
	**/
	var width : Float;
	/**
		The height of the Rectangle, i.e. the distance between its top side (defined by `y`) and its bottom side.
	**/
	var height : Float;
	/**
		Checks if the given point is inside the Rectangle's bounds.
	**/
	function contains(x:Float, y:Float):Bool;
	/**
		Calculates the coordinates of a point at a certain `position` on the Rectangle's perimeter.
		
		The `position` is a fraction between 0 and 1 which defines how far into the perimeter the point is.
		
		A value of 0 or 1 returns the point at the top left corner of the rectangle, while a value of 0.5 returns the point at the bottom right corner of the rectangle. Values between 0 and 0.5 are on the top or the right side and values between 0.5 and 1 are on the bottom or the left side.
	**/
	function getPoint<O>(position:Float, ?output:O):O;
	/**
		Returns an array of points from the perimeter of the Rectangle, each spaced out based on the quantity or step required.
	**/
	function getPoints<O>(quantity:Float, ?stepRate:Float, ?output:O):O;
	/**
		Returns a random point within the Rectangle's bounds.
	**/
	function getRandomPoint<O>(?point:O):O;
	/**
		Sets the position, width, and height of the Rectangle.
	**/
	function setTo(x:Float, y:Float, width:Float, height:Float):Rectangle;
	/**
		Resets the position, width, and height of the Rectangle to 0.
	**/
	function setEmpty():Rectangle;
	/**
		Sets the position of the Rectangle.
	**/
	function setPosition(x:Float, ?y:Float):Rectangle;
	/**
		Sets the width and height of the Rectangle.
	**/
	function setSize(width:Float, ?height:Float):Rectangle;
	/**
		Determines if the Rectangle is empty. A Rectangle is empty if its width or height is less than or equal to 0.
	**/
	function isEmpty():Bool;
	/**
		Returns a Line object that corresponds to the top of this Rectangle.
	**/
	function getLineA<O>(?line:O):O;
	/**
		Returns a Line object that corresponds to the right of this Rectangle.
	**/
	function getLineB<O>(?line:O):O;
	/**
		Returns a Line object that corresponds to the bottom of this Rectangle.
	**/
	function getLineC<O>(?line:O):O;
	/**
		Returns a Line object that corresponds to the left of this Rectangle.
	**/
	function getLineD<O>(?line:O):O;
	/**
		The x coordinate of the left of the Rectangle.
		Changing the left property of a Rectangle object has no effect on the y and height properties. However it does affect the width property, whereas changing the x value does not affect the width property.
	**/
	var left : Float;
	/**
		The sum of the x and width properties.
		Changing the right property of a Rectangle object has no effect on the x, y and height properties, however it does affect the width property.
	**/
	var right : Float;
	/**
		The y coordinate of the top of the Rectangle. Changing the top property of a Rectangle object has no effect on the x and width properties.
		However it does affect the height property, whereas changing the y value does not affect the height property.
	**/
	var top : Float;
	/**
		The sum of the y and height properties.
		Changing the bottom property of a Rectangle object has no effect on the x, y and width properties, but does change the height property.
	**/
	var bottom : Float;
	/**
		The x coordinate of the center of the Rectangle.
	**/
	var centerX : Float;
	/**
		The y coordinate of the center of the Rectangle.
	**/
	var centerY : Float;
	static var prototype : Rectangle;
	/**
		Calculates the area of the given Rectangle object.
	**/
	static function Area(rect:Rectangle):Float;
	/**
		Rounds a Rectangle's position up to the smallest integer greater than or equal to each current coordinate.
	**/
	static function Ceil<O>(rect:O):O;
	/**
		Rounds a Rectangle's position and size up to the smallest integer greater than or equal to each respective value.
	**/
	static function CeilAll<O>(rect:O):O;
	/**
		Moves the top-left corner of a Rectangle so that its center is at the given coordinates.
	**/
	static function CenterOn<O>(rect:O, x:Float, y:Float):O;
	/**
		Creates a new Rectangle which is identical to the given one.
	**/
	static function Clone(source:Rectangle):Rectangle;
	/**
		Checks if a given point is inside a Rectangle's bounds.
	**/
	static function Contains(rect:Rectangle, x:Float, y:Float):Bool;
	/**
		Determines whether the specified point is contained within the rectangular region defined by this Rectangle object.
	**/
	static function ContainsPoint(rect:Rectangle, point:Point):Bool;
	/**
		Tests if one rectangle fully contains another.
	**/
	static function ContainsRect(rectA:Rectangle, rectB:Rectangle):Bool;
	/**
		Copy the values of one Rectangle to a destination Rectangle.
	**/
	static function CopyFrom<O>(source:Rectangle, dest:O):O;
	/**
		Create an array of points for each corner of a Rectangle
		If an array is specified, each point object will be added to the end of the array, otherwise a new array will be created.
	**/
	static function Decompose(rect:Rectangle, ?out:Array<Dynamic>):Array<Dynamic>;
	/**
		Compares the `x`, `y`, `width` and `height` properties of two rectangles.
	**/
	static function Equals(rect:Rectangle, toCompare:Rectangle):Bool;
	/**
		Adjusts the target rectangle, changing its width, height and position,
		so that it fits inside the area of the source rectangle, while maintaining its original
		aspect ratio.
		
		Unlike the `FitOutside` function, there may be some space inside the source area not covered.
	**/
	static function FitInside<O>(target:O, source:Rectangle):O;
	/**
		Adjusts the target rectangle, changing its width, height and position,
		so that it fully covers the area of the source rectangle, while maintaining its original
		aspect ratio.
		
		Unlike the `FitInside` function, the target rectangle may extend further out than the source.
	**/
	static function FitOutside<O>(target:O, source:Rectangle):O;
	/**
		Rounds down (floors) the top left X and Y coordinates of the given Rectangle to the largest integer less than or equal to them
	**/
	static function Floor<O>(rect:O):O;
	/**
		Rounds a Rectangle's position and size down to the largest integer less than or equal to each current coordinate or dimension.
	**/
	static function FloorAll<O>(rect:O):O;
	/**
		Constructs new Rectangle or repositions and resizes an existing Rectangle so that all of the given points are on or within its bounds.
	**/
	static function FromPoints<O>(points:Array<Dynamic>, ?out:O):O;
	/**
		Create the smallest Rectangle containing two coordinate pairs.
	**/
	static function FromXY<O>(x1:Float, y1:Float, x2:Float, y2:Float, ?out:O):O;
	/**
		Calculates the width/height ratio of a rectangle.
	**/
	static function GetAspectRatio(rect:Rectangle):Float;
	/**
		Returns the center of a Rectangle as a Point.
	**/
	static function GetCenter<O>(rect:Rectangle, ?out:O):O;
	/**
		Calculates the coordinates of a point at a certain `position` on the Rectangle's perimeter.
		
		The `position` is a fraction between 0 and 1 which defines how far into the perimeter the point is.
		
		A value of 0 or 1 returns the point at the top left corner of the rectangle, while a value of 0.5 returns the point at the bottom right corner of the rectangle. Values between 0 and 0.5 are on the top or the right side and values between 0.5 and 1 are on the bottom or the left side.
	**/
	static function GetPoint<O>(rectangle:Rectangle, position:Float, ?out:O):O;
	/**
		Return an array of points from the perimeter of the rectangle, each spaced out based on the quantity or step required.
	**/
	static function GetPoints<O>(rectangle:Rectangle, step:Float, quantity:Float, ?out:O):O;
	/**
		Returns the size of the Rectangle, expressed as a Point object.
		With the value of the `width` as the `x` property and the `height` as the `y` property.
	**/
	static function GetSize<O>(rect:Rectangle, ?out:O):O;
	/**
		Increases the size of a Rectangle by a specified amount.
		
		The center of the Rectangle stays the same. The amounts are added to each side, so the actual increase in width or height is two times bigger than the respective argument.
	**/
	static function Inflate<O>(rect:O, x:Float, y:Float):O;
	/**
		Takes two Rectangles and first checks to see if they intersect.
		If they intersect it will return the area of intersection in the `out` Rectangle.
		If they do not intersect, the `out` Rectangle will have a width and height of zero.
	**/
	static function Intersection<O>(rectA:Rectangle, rectB:Rectangle, ?out:Rectangle):O;
	/**
		Returns an array of points from the perimeter of the Rectangle, where each point is spaced out based
		on either the `step` value, or the `quantity`.
	**/
	static function MarchingAnts<O>(rect:Rectangle, ?step:Float, ?quantity:Float, ?out:O):O;
	/**
		Merges a Rectangle with a list of points by repositioning and/or resizing it such that all points are located on or within its bounds.
	**/
	static function MergePoints<O>(target:O, points:Array<Point>):O;
	/**
		Merges the source rectangle into the target rectangle and returns the target.
		Neither rectangle should have a negative width or height.
	**/
	static function MergeRect<O>(target:O, source:Rectangle):O;
	/**
		Merges a Rectangle with a point by repositioning and/or resizing it so that the point is on or within its bounds.
	**/
	static function MergeXY<O>(target:O, x:Float, y:Float):O;
	/**
		Nudges (translates) the top left corner of a Rectangle by a given offset.
	**/
	static function Offset<O>(rect:O, x:Float, y:Float):O;
	/**
		Nudges (translates) the top-left corner of a Rectangle by the coordinates of a point (translation vector).
	**/
	static function OffsetPoint<O>(rect:O, point:ts.AnyOf2<global.phaser.math.Vector2, Point>):O;
	/**
		Checks if two Rectangles overlap. If a Rectangle is within another Rectangle, the two will be considered overlapping. Thus, the Rectangles are treated as "solid".
	**/
	static function Overlaps(rectA:Rectangle, rectB:Rectangle):Bool;
	/**
		Calculates the perimeter of a Rectangle.
	**/
	static function Perimeter(rect:Rectangle):Float;
	/**
		Returns a Point from the perimeter of a Rectangle based on the given angle.
	**/
	static function PerimeterPoint<O>(rectangle:Rectangle, angle:Float, ?out:O):O;
	/**
		Returns a random point within a Rectangle.
	**/
	static function Random<O>(rect:Rectangle, out:O):O;
	/**
		Calculates a random point that lies within the `outer` Rectangle, but outside of the `inner` Rectangle.
		The inner Rectangle must be fully contained within the outer rectangle.
	**/
	static function RandomOutside<O>(outer:Rectangle, inner:Rectangle, ?out:O):O;
	/**
		Determines if the two objects (either Rectangles or Rectangle-like) have the same width and height values under strict equality.
	**/
	static function SameDimensions(rect:Rectangle, toCompare:Rectangle):Bool;
	/**
		Scales the width and height of this Rectangle by the given amounts.
	**/
	static function Scale<O>(rect:O, x:Float, y:Float):O;
	/**
		Creates a new Rectangle or repositions and/or resizes an existing Rectangle so that it encompasses the two given Rectangles, i.e. calculates their union.
	**/
	static function Union<O>(rectA:Rectangle, rectB:Rectangle, ?out:O):O;
}