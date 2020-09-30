package global;

@:native("MatterJS") @valueModuleOnly extern class MatterJS {
	/**
		Installs the given plugins on the `Matter` namespace.
		This is a short-hand for `Plugin.use`, see it for more information.
		Call this function once at the start of your code, with all of the plugins you wish to install as arguments.
		Avoid calling this function multiple times unless you intend to manually control installation order.
	**/
	static function use(plugins:haxe.extern.Rest<ts.AnyOf2<String, global.matterjs.Plugin>>):Void;
}