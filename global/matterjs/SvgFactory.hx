package global.matterjs;

@:native("MatterJS.SvgFactory") extern class SvgFactory {
	function new();
	/**
		Converts an SVG path into an array of vector points.
		If the input path forms a concave shape, you must decompose the result into convex parts before use.
		See `Bodies.fromVertices` which provides support for this.
		Note that this function is not guaranteed to support complex paths (such as those with holes).
	**/
	function pathToVertices(path:js.html.svg.PathElement, sampleLength:Float):Array<Vector>;
	static var prototype : SvgFactory;
}