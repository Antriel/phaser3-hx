package global.matterjs;

@:native("MatterJS.Plugin") extern class Plugin {
	function new();
	var name : String;
	var version : String;
	dynamic function install():Void;
	@:optional
	@:native("for")
	var for_ : String;
	static var prototype : Plugin;
	/**
		Registers a plugin object so it can be resolved later by name.
	**/
	static function register(plugin:Plugin):Plugin;
	/**
		Resolves a dependency to a plugin object from the registry if it exists. 
		The `dependency` may contain a version, but only the name matters when resolving.
	**/
	static function resolve(dependency:String):Null<Plugin>;
	/**
		Returns `true` if the object meets the minimum standard to be considered a plugin.
		This means it must define the following properties:
		- `name`
		- `version`
		- `install`
	**/
	static function isPlugin(obj:{ }):Bool;
	/**
		Returns a pretty printed plugin name and version.
	**/
	static function toString(plugin:ts.AnyOf2<String, Plugin>):String;
	/**
		Returns `true` if `plugin.for` is applicable to `module` by comparing against `module.name` and `module.version`.
		If `plugin.for` is not specified then it is assumed to be applicable.
		The value of `plugin.for` is a string of the format `'module-name'` or `'module-name@version'`.
	**/
	static function isFor(plugin:Plugin, module:{ @:optional var name : String; }):Bool;
	/**
		Installs the plugins by calling `plugin.install` on each plugin specified in `plugins` if passed, otherwise `module.uses`.
		For installing plugins on `Matter` see the convenience function `Matter.use`.
		Plugins may be specified either by their name or a reference to the plugin object.
		Plugins themselves may specify further dependencies, but each plugin is installed only once.
		Order is important, a topological sort is performed to find the best resulting order of installation.
		This sorting attempts to satisfy every dependency's requested ordering, but may not be exact in all cases.
		This function logs the resulting status of each dependency in the console, along with any warnings.
		- A green tick ✅ indicates a dependency was resolved and installed.
		- An orange diamond 🔶 indicates a dependency was resolved but a warning was thrown for it or one if its dependencies.
		- A red cross ❌ indicates a dependency could not be resolved.
		Avoid calling this function multiple times on the same module unless you intend to manually control installation order.
	**/
	static function use(module:{ @:optional var uses : Array<ts.AnyOf2<String, Plugin>>; }, plugins:Array<ts.AnyOf2<String, Plugin>>):Void;
	/**
		Recursively finds all of a module's dependencies and returns a flat dependency graph.
	**/
	static function dependencies(module:Dependency, ?tracked:{ }):Null<ts.AnyOf2<String, { }>>;
	/**
		Parses a dependency string into its components.
		The `dependency` is a string of the format `'module-name'` or `'module-name@version'`.
		See documentation for `Plugin.versionParse` for a description of the format.
		This function can also handle dependencies that are already resolved (e.g. a module object).
	**/
	static function dependencyParse(dependency:Dependency):{
		var name : String;
		var range : String;
	};
	/**
		Parses a version string into its components.
		Versions are strictly of the format `x.y.z` (as in [semver](http://semver.org/)).
		Versions may optionally have a prerelease tag in the format `x.y.z-alpha`.
		Ranges are a strict subset of [npm ranges](https://docs.npmjs.com/misc/semver#advanced-range-syntax).
		Only the following range types are supported:
		- Tilde ranges e.g. `~1.2.3`
		- Caret ranges e.g. `^1.2.3`
		- Exact version e.g. `1.2.3`
		- Any version `*`
	**/
	static function versionParse(range:String):{
		var isRange : Bool;
		var version : String;
		var range : String;
		@:native("operator")
		var operator_ : String;
		var parts : Array<Float>;
		var prerelease : String;
		var number : Float;
	};
	/**
		Returns `true` if `version` satisfies the given `range`.
		See documentation for `Plugin.versionParse` for a description of the format.
		If a version or range is not specified, then any version (`*`) is assumed to satisfy.
	**/
	static function versionSatisfies(version:String, range:String):Bool;
}