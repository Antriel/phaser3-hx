package global.phaser.plugins;

/**
	The PluginManager is responsible for installing and adding plugins to Phaser.
	
	It is a global system and therefore belongs to the Game instance, not a specific Scene.
	
	It works in conjunction with the PluginCache. Core internal plugins automatically register themselves 
	with the Cache, but it's the Plugin Manager that is responsible for injecting them into the Scenes.
	
	There are two types of plugin:
	
	1. A Global Plugin
	2. A Scene Plugin
	
	A Global Plugin is a plugin that lives within the Plugin Manager rather than a Scene. You can get
	access to it by calling `PluginManager.get` and providing a key. Any Scene that requests a plugin in
	this way will all get access to the same plugin instance, allowing you to use a single plugin across
	multiple Scenes.
	
	A Scene Plugin is a plugin dedicated to running within a Scene. These are different to Global Plugins
	in that their instances do not live within the Plugin Manager, but within the Scene Systems class instead.
	And that every Scene created is given its own unique instance of a Scene Plugin. Examples of core Scene
	Plugins include the Input Plugin, the Tween Plugin and the physics Plugins.
	
	You can add a plugin to Phaser in three different ways:
	
	1. Preload it
	2. Include it in your source code and install it via the Game Config
	3. Include it in your source code and install it within a Scene
	
	For examples of all of these approaches please see the Phaser 3 Examples Repo `plugins` folder.
	
	For information on creating your own plugin please see the Phaser 3 Plugin Template.
**/
@:native("Phaser.Plugins.PluginManager") extern class PluginManager {
	function new(game:global.phaser.Game);
	/**
		The game instance that owns this Plugin Manager.
	**/
	var game : global.phaser.Game;
	/**
		The global plugins currently running and managed by this Plugin Manager.
		A plugin must have been started at least once in order to appear in this list.
	**/
	var plugins : Array<global.phaser.types.plugins.GlobalPlugin>;
	/**
		A list of plugin keys that should be installed into Scenes as well as the Core Plugins.
	**/
	var scenePlugins : Array<String>;
	/**
		Run once the game has booted and installs all of the plugins configured in the Game Config.
	**/
	private function boot():Void;
	/**
		Called by the Scene Systems class. Tells the plugin manager to install all Scene plugins into it.
		
		First it will install global references, i.e. references from the Game systems into the Scene Systems (and Scene if mapped.)
		Then it will install Core Scene Plugins followed by Scene Plugins registered with the PluginManager.
		Finally it will install any references to Global Plugins that have a Scene mapping property into the Scene itself.
	**/
	private function addToScene(sys:global.phaser.scenes.Systems, globalPlugins:Array<Dynamic>, scenePlugins:Array<Dynamic>):Void;
	/**
		Called by the Scene Systems class. Returns a list of plugins to be installed.
	**/
	private function getDefaultScenePlugins():Array<String>;
	/**
		Installs a new Scene Plugin into the Plugin Manager and optionally adds it
		to the given Scene as well. A Scene Plugin added to the manager in this way
		will be automatically installed into all new Scenes using the key and mapping given.
		
		The `key` property is what the plugin is injected into Scene.Systems as.
		The `mapping` property is optional, and if specified is what the plugin is installed into
		the Scene as. For example:
		
		```javascript
		this.plugins.installScenePlugin('powerupsPlugin', pluginCode, 'powerups');
		
		// and from within the scene:
		this.sys.powerupsPlugin; // key value
		this.powerups; // mapping value
		```
		
		This method is called automatically by Phaser if you install your plugins using either the
		Game Configuration object, or by preloading them via the Loader.
	**/
	function installScenePlugin(key:String, plugin:haxe.Constraints.Function, ?mapping:String, ?addToScene:global.phaser.Scene, ?fromLoader:Bool):Void;
	/**
		Installs a new Global Plugin into the Plugin Manager and optionally starts it running.
		A global plugin belongs to the Plugin Manager, rather than a specific Scene, and can be accessed
		and used by all Scenes in your game.
		
		The `key` property is what you use to access this plugin from the Plugin Manager.
		
		```javascript
		this.plugins.install('powerupsPlugin', pluginCode);
		
		// and from within the scene:
		this.plugins.get('powerupsPlugin');
		```
		
		This method is called automatically by Phaser if you install your plugins using either the
		Game Configuration object, or by preloading them via the Loader.
		
		The same plugin can be installed multiple times into the Plugin Manager by simply giving each
		instance its own unique key.
	**/
	function install(key:String, plugin:haxe.Constraints.Function, ?start:Bool, ?mapping:String, ?data:Dynamic):BasePlugin;
	/**
		Gets an index of a global plugin based on the given key.
	**/
	private function getIndex(key:String):Float;
	/**
		Gets a global plugin based on the given key.
	**/
	private function getEntry(key:String):global.phaser.types.plugins.GlobalPlugin;
	/**
		Checks if the given global plugin, based on its key, is active or not.
	**/
	function isActive(key:String):Bool;
	/**
		Starts a global plugin running.
		
		If the plugin was previously active then calling `start` will reset it to an active state and then
		call its `start` method.
		
		If the plugin has never been run before a new instance of it will be created within the Plugin Manager,
		its active state set and then both of its `init` and `start` methods called, in that order.
		
		If the plugin is already running under the given key then nothing happens.
	**/
	function start(key:String, ?runAs:String):BasePlugin;
	/**
		Stops a global plugin from running.
		
		If the plugin is active then its active state will be set to false and the plugins `stop` method
		will be called.
		
		If the plugin is not already running, nothing will happen.
	**/
	function stop(key:String):PluginManager;
	/**
		Gets a global plugin from the Plugin Manager based on the given key and returns it.
		
		If it cannot find an active plugin based on the key, but there is one in the Plugin Cache with the same key,
		then it will create a new instance of the cached plugin and return that.
	**/
	function get(key:String, ?autoStart:Bool):ts.AnyOf2<haxe.Constraints.Function, BasePlugin>;
	/**
		Returns the plugin class from the cache.
		Used internally by the Plugin Manager.
	**/
	function getClass(key:String):BasePlugin;
	/**
		Removes a global plugin from the Plugin Manager and Plugin Cache.
		
		It is up to you to remove all references to this plugin that you may hold within your game code.
	**/
	function removeGlobalPlugin(key:String):Void;
	/**
		Removes a scene plugin from the Plugin Manager and Plugin Cache.
		
		This will not remove the plugin from any active Scenes that are already using it.
		
		It is up to you to remove all references to this plugin that you may hold within your game code.
	**/
	function removeScenePlugin(key:String):Void;
	/**
		Registers a new type of Game Object with the global Game Object Factory and / or Creator.
		This is usually called from within your Plugin code and is a helpful short-cut for creating
		new Game Objects.
		
		The key is the property that will be injected into the factories and used to create the
		Game Object. For example:
		
		```javascript
		this.plugins.registerGameObject('clown', clownFactoryCallback, clownCreatorCallback);
		// later in your game code:
		this.add.clown();
		this.make.clown();
		```
		
		The callbacks are what are called when the factories try to create a Game Object
		matching the given key. It's important to understand that the callbacks are invoked within
		the context of the GameObjectFactory. In this context there are several properties available
		to use:
		
		this.scene - A reference to the Scene that owns the GameObjectFactory.
		this.displayList - A reference to the Display List the Scene owns.
		this.updateList - A reference to the Update List the Scene owns.
		
		See the GameObjectFactory and GameObjectCreator classes for more details.
		Any public property or method listed is available from your callbacks under `this`.
	**/
	function registerGameObject(key:String, ?factoryCallback:haxe.Constraints.Function, ?creatorCallback:haxe.Constraints.Function):Void;
	/**
		Removes a previously registered Game Object from the global Game Object Factory and / or Creator.
		This is usually called from within your Plugin destruction code to help clean-up after your plugin has been removed.
	**/
	function removeGameObject(key:String, ?removeFromFactory:Bool, ?removeFromCreator:Bool):Void;
	/**
		Registers a new file type with the global File Types Manager, making it available to all Loader
		Plugins created after this.
		
		This is usually called from within your Plugin code and is a helpful short-cut for creating
		new loader file types.
		
		The key is the property that will be injected into the Loader Plugin and used to load the
		files. For example:
		
		```javascript
		this.plugins.registerFileType('wad', doomWadLoaderCallback);
		// later in your preload code:
		this.load.wad();
		```
		
		The callback is what is called when the loader tries to load a file  matching the given key.
		It's important to understand that the callback is invoked within
		the context of the LoaderPlugin. In this context there are several properties / methods available
		to use:
		
		this.addFile - A method to add the new file to the load queue.
		this.scene - The Scene that owns the Loader Plugin instance.
		
		See the LoaderPlugin class for more details. Any public property or method listed is available from
		your callback under `this`.
	**/
	function registerFileType(key:String, callback:haxe.Constraints.Function, ?addToScene:global.phaser.Scene):Void;
	/**
		Destroys this Plugin Manager and all associated plugins.
		It will iterate all plugins found and call their `destroy` methods.
		
		The PluginCache will remove all custom plugins.
	**/
	function destroy():Void;
	static var prototype : PluginManager;
}