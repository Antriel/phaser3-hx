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
		Checks for intersection between the two line segments and returns the intersection point as a Vector3,
		or `null` if the lines are parallel, or do not intersect.
		
		The `z` property of the Vector3 contains the intersection distance, which can be used to find
		the closest intersecting point from a group of line segments.
	**/
	static function GetLineToLine(line1:Line, line2:Line, ?out:global.phaser.math.Vector3):global.phaser.math.Vector3;
	/**
		Checks for the closest point of intersection between a line segment and an array of points, where each pair
		of points are converted to line segments for the intersection tests.
		
		If no intersection is found, this function returns `null`.
		
		If intersection was found, a Vector3 is returned with the following properties:
		
		The `x` and `y` components contain the point of the intersection.
		The `z` component contains the closest distance.
	**/
	static function GetLineToPoints(line:Line, points:ts.AnyOf2<Array<Point>, Array<global.phaser.math.Vector2>>, ?out:global.phaser.math.Vector3):global.phaser.math.Vector3;
	/**
		Checks for the closest point of intersection between a line segment and an array of polygons.
		
		If no intersection is found, this function returns `null`.
		
		If intersection was found, a Vector4 is returned with the following properties:
		
		The `x` and `y` components contain the point of the intersection.
		The `z` component contains the closest distance.
		The `w` component contains the index of the polygon, in the given array, that triggered the intersection.
	**/
	static function GetLineToPolygon(line:Line, polygons:ts.AnyOf2<Polygon, Array<Polygon>>, ?out:global.phaser.math.Vector4):global.phaser.math.Vector4;
	/**
		Checks for intersection between the Line and a Rectangle shape,
		and returns the intersection points as a Point object array.
	**/
	static function GetLineToRectangle(line:Line, rect:ts.AnyOf2<Dynamic, Rectangle>, ?out:Array<Dynamic>):Array<Dynamic>;
	/**
		Projects rays out from the given point to each line segment of the polygons.
		
		If the rays intersect with the polygons, the points of intersection are returned in an array.
		
		If no intersections are found, the returned array will be empty.
		
		Each Vector4 intersection result has the following properties:
		
		The `x` and `y` components contain the point of the intersection.
		The `z` component contains the angle of intersection.
		The `w` component contains the index of the polygon, in the given array, that triggered the intersection.
	**/
	static function GetRaysFromPointToPolygon(x:Float, y:Float, polygons:ts.AnyOf2<Polygon, Array<Polygon>>):Array<global.phaser.math.Vector4>;
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