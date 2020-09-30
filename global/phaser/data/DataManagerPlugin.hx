package global.phaser.data;

/**
	The Data Component features a means to store pieces of data specific to a Game Object, System or Plugin.
	You can then search, query it, and retrieve the data. The parent must either extend EventEmitter,
	or have a property called `events` that is an instance of it.
**/
@:native("Phaser.Data.DataManagerPlugin") extern class DataManagerPlugin extends DataManager {
	function new(scene:global.phaser.Scene);
	/**
		A reference to the Scene that this DataManager belongs to.
	**/
	var scene : global.phaser.Scene;
	/**
		A reference to the Scene's Systems.
	**/
	var systems : global.phaser.scenes.Systems;
	/**
		Sets a value for the given key. If the key doesn't already exist in the Data Manager then it is created.
		
		```javascript
		data.set('name', 'Red Gem Stone');
		```
		
		You can also pass in an object of key value pairs as the first argument:
		
		```javascript
		data.set({ name: 'Red Gem Stone', level: 2, owner: 'Link', gold: 50 });
		```
		
		To get a value back again you can call `get`:
		
		```javascript
		data.get('gold');
		```
		
		Or you can access the value directly via the `values` property, where it works like any other variable:
		
		```javascript
		data.values.gold += 50;
		```
		
		When the value is first set, a `setdata` event is emitted.
		
		If the key already exists, a `changedata` event is emitted instead, along an event named after the key.
		For example, if you updated an existing key called `PlayerLives` then it would emit the event `changedata-PlayerLives`.
		These events will be emitted regardless if you use this method to set the value, or the direct `values` setter.
		
		Please note that the data keys are case-sensitive and must be valid JavaScript Object property strings.
		This means the keys `gold` and `Gold` are treated as two unique values within the Data Manager.
	**/
	function set(key:ts.AnyOf2<String, Dynamic>, data:Dynamic):DataManagerPlugin;
	/**
		Passes all data entries to the given callback.
	**/
	function each(callback:global.DataEachCallback, ?context:Dynamic, args:haxe.extern.Rest<Dynamic>):DataManagerPlugin;
	/**
		Merge the given object of key value pairs into this DataManager.
		
		Any newly created values will emit a `setdata` event. Any updated values (see the `overwrite` argument)
		will emit a `changedata` event.
	**/
	function merge(data:{ }, ?overwrite:Bool):DataManagerPlugin;
	/**
		Remove the value for the given key.
		
		If the key is found in this Data Manager it is removed from the internal lists and a
		`removedata` event is emitted.
		
		You can also pass in an array of keys, in which case all keys in the array will be removed:
		
		```javascript
		this.data.remove([ 'gold', 'armor', 'health' ]);
		```
	**/
	function remove(key:ts.AnyOf2<String, Array<String>>):DataManagerPlugin;
	/**
		Freeze or unfreeze this Data Manager. A frozen Data Manager will block all attempts
		to create new values or update existing ones.
	**/
	function setFreeze(value:Bool):DataManagerPlugin;
	/**
		Delete all data in this Data Manager and unfreeze it.
	**/
	function reset():DataManagerPlugin;
	static var prototype : DataManagerPlugin;
}