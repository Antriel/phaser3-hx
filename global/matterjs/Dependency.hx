package global.matterjs;

typedef Dependency = ts.AnyOf3<String, {
	var name : String;
	var range : String;
}, {
	var name : String;
	var version : String;
}>;