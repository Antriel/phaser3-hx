package global.matterjs;

typedef IChamfer = {
	@:optional
	var radius : ts.AnyOf2<Float, Array<Float>>;
	@:optional
	var quality : Float;
	@:optional
	var qualityMin : Float;
	@:optional
	var qualityMax : Float;
};