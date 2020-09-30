package global.matterjs;

/**
	The `Matter.Svg` module contains methods for converting SVG images into an array of vector points.
	
	See the included usage [examples](https://github.com/liabru/matter-js/tree/master/examples).
**/
@:native("MatterJS.Svg") extern class Svg {
	function new();
	static var prototype : Svg;
	/**
		Converts an SVG path into an array of vector points.
		If the input path forms a concave shape, you must decompose the result into convex parts before use.
		See `Bodies.fromVertices` which provides support for this.
		Note that this function is not guaranteed to support complex paths (such as those with holes).
	**/
	static function pathToVertices(path:js.html.svg.PathElement, sampleLength:Float):Array<Vector>;
}