package global.phaser.geom;

@:native("Phaser.Geom.Intersects") @valueModuleOnly extern class Intersects {
	/**
		Checks if two Circles intersect.
	**/
	static function CircleToCircle(circleA:Circle, circleB:Circle):Bool;
	/**
		Checks for intersection between a circle and a rectangle.
	**/
	static function CircleToRectangle(circle:Circle, rect:Rectangle):Bool;
	/**
		Checks if two Circles intersect and returns the intersection points as a Point object array.
	**/
	static function GetCircleToCircle(circleA:Circle, circleB:Circle, ?out:Array<Dynamic>):Array<Dynamic>;
	/**
		Checks for intersection between a circle and a rectangle,
		and returns the intersection points as a Point object array.
	**/
	static function GetCircleToRectangle(circle:Circle, rect:Rectangle, ?out:Array<Dynamic>):Array<Dynamic>;
	/**
		Checks for intersection between the line segment and circle,
		and returns the intersection points as a Point object array.
	**/
	static function GetLineToCircle(line:Line, circle:Circle, ?out:Array<Dynamic>):Array<Dynamic>;
	/**
		Checks for intersection between the Line and a Rectangle shape,
		and returns the intersection points as a Point object array.
	**/
	static function GetLineToRectangle(line:Line, rect:ts.AnyOf2<Dynamic, Rectangle>, ?out:Array<Dynamic>):Array<Dynamic>;
	/**
		Checks if two Rectangle shapes intersect and returns the area of this intersection as Rectangle object.
		
		If optional `output` parameter is omitted, new Rectangle object is created and returned. If there is intersection, it will contain intersection area. If there is no intersection, it wil be empty Rectangle (all values set to zero).
		
		If Rectangle object is passed as `output` and there is intersection, then intersection area data will be loaded into it and it will be returned. If there is no intersection, it will be returned without any change.
	**/
	static function GetRectangleIntersection<O>(rectA:Rectangle, rectB:Rectangle, ?output:O):O;
	/**
		Checks if two Rectangles intersect and returns the intersection points as a Point object array.
		
		A Rectangle intersects another Rectangle if any part of its bounds is within the other Rectangle's bounds. As such, the two Rectangles are considered "solid". A Rectangle with no width or no height will never intersect another Rectangle.
	**/
	static function GetRectangleToRectangle(rectA:Rectangle, rectB:Rectangle, ?out:Array<Dynamic>):Array<Dynamic>;
	/**
		Checks for intersection between Rectangle shape and Triangle shape,
		and returns the intersection points as a Point object array.
	**/
	static function GetRectangleToTriangle(rect:Rectangle, triangle:Triangle, ?out:Array<Dynamic>):Array<Dynamic>;
	/**
		Checks if a Triangle and a Circle intersect, and returns the intersection points as a Point object array.
		
		A Circle intersects a Triangle if its center is located within it or if any of the Triangle's sides intersect the Circle. As such, the Triangle and the Circle are considered "solid" for the intersection.
	**/
	static function GetTriangleToCircle(triangle:Triangle, circle:Circle, ?out:Array<Dynamic>):Array<Dynamic>;
	/**
		Checks if a Triangle and a Line intersect, and returns the intersection points as a Point object array.
		
		The Line intersects the Triangle if it starts inside of it, ends inside of it, or crosses any of the Triangle's sides. Thus, the Triangle is considered "solid".
	**/
	static function GetTriangleToLine(triangle:Triangle, line:Line, ?out:Array<Dynamic>):Array<Dynamic>;
	/**
		Checks if two Triangles intersect, and returns the intersection points as a Point object array.
		
		A Triangle intersects another Triangle if any pair of their lines intersects or if any point of one Triangle is within the other Triangle. Thus, the Triangles are considered "solid".
	**/
	static function GetTriangleToTriangle(triangleA:Triangle, triangleB:Triangle, ?out:Array<Dynamic>):Array<Dynamic>;
	/**
		Checks for intersection between the line segment and circle.
		
		Based on code by [Matt DesLauriers](https://github.com/mattdesl/line-circle-collision/blob/master/LICENSE.md).
	**/
	static function LineToCircle(line:Line, circle:Circle, ?nearest:Dynamic):Bool;
	/**
		Checks if two Lines intersect. If the Lines are identical, they will be treated as parallel and thus non-intersecting.
	**/
	static function LineToLine(line1:Line, line2:Line, ?out:Point):Bool;
	/**
		Checks for intersection between the Line and a Rectangle shape, or a rectangle-like
		object, with public `x`, `y`, `right` and `bottom` properties, such as a Sprite or Body.
		
		An intersection is considered valid if:
		
		The line starts within, or ends within, the Rectangle.
		The line segment intersects one of the 4 rectangle edges.
		
		The for the purposes of this function rectangles are considered 'solid'.
	**/
	static function LineToRectangle(line:Line, rect:ts.AnyOf2<Dynamic, Rectangle>):Bool;
	/**
		Checks if the a Point falls between the two end-points of a Line, based on the given line thickness.
		
		Assumes that the line end points are circular, not square.
	**/
	static function PointToLine(point:Dynamic, line:Line, ?lineThickness:Float):Bool;
	/**
		Checks if a Point is located on the given line segment.
	**/
	static function PointToLineSegment(point:Point, line:Line):Bool;
	/**
		Checks if two Rectangles intersect.
		
		A Rectangle intersects another Rectangle if any part of its bounds is within the other Rectangle's bounds.
		As such, the two Rectangles are considered "solid".
		A Rectangle with no width or no height will never intersect another Rectangle.
	**/
	static function RectangleToRectangle(rectA:Rectangle, rectB:Rectangle):Bool;
	/**
		Checks for intersection between Rectangle shape and Triangle shape.
	**/
	static function RectangleToTriangle(rect:Rectangle, triangle:Triangle):Bool;
	/**
		Check if rectangle intersects with values.
	**/
	static function RectangleToValues(rect:Rectangle, left:Float, right:Float, top:Float, bottom:Float, ?tolerance:Float):Bool;
	/**
		Checks if a Triangle and a Circle intersect.
		
		A Circle intersects a Triangle if its center is located within it or if any of the Triangle's sides intersect the Circle. As such, the Triangle and the Circle are considered "solid" for the intersection.
	**/
	static function TriangleToCircle(triangle:Triangle, circle:Circle):Bool;
	/**
		Checks if a Triangle and a Line intersect.
		
		The Line intersects the Triangle if it starts inside of it, ends inside of it, or crosses any of the Triangle's sides. Thus, the Triangle is considered "solid".
	**/
	static function TriangleToLine(triangle:Triangle, line:Line):Bool;
	/**
		Checks if two Triangles intersect.
		
		A Triangle intersects another Triangle if any pair of their lines intersects or if any point of one Triangle is within the other Triangle. Thus, the Triangles are considered "solid".
	**/
	static function TriangleToTriangle(triangleA:Triangle, triangleB:Triangle):Bool;
}