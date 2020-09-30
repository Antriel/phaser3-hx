package global.phaser.data;

/**
	The Data Manager Component features a means to store pieces of data specific to a Game Object, System or Plugin.
	You can then search, query it, and retrieve the data. The parent must either extend EventEmitter,
	or have a property called `events` that is an instance of it.
**/
@:native("Phaser.Data.DataManager") extern class DataManager {
	function new(parent:Dynamic, ?eventEmitter:global.phaser.events.EventEmitter);
	/**
		The object that this DataManager belongs to.
	**/
	var parent : Dynamic;
	/**
		The DataManager's event emitter.
	**/
	var events : global.phaser.events.EventEmitter;
	/**
		The data list.
	**/
	var list : { };
	/**
		The public values list. You can use this to access anything you have stored
		in this Data Manager. For example, if you set a value called `gold` you can
		access it via:
		
		```javascript
		this.data.values.gold;
		```
		
		You can also modify it directly:
		
		```javascript
		this.data.values.gold += 1000;
		```
		
		Doing so will emit a `setdata` event from the parent of this Data Manager.
		
		Do not modify this object directly. Adding properties directly to this object will not
		emit any events. Always use `DataManager.set` to create new items the first time around.
	**/
	var values : { };
	/**
		Retrieves the value for the given key, or undefined if it doesn't exist.
		
		You can also access values via the `values` object. For example, if you had a key called `gold` you can do either:
		
		```javascript
		this.data.get('gold');
		```
		
		Or access the value directly:
		
		```javascript
		this.data.values.gold;
		```
		
		You can also pass in an array of keys, in which case an array of values will be returned:
		
		```javascript
		this.data.get([ 'gold', 'armor', 'health' ]);
		```
		
		This approach is useful for destructuring arrays in ES6.
	**/
	function get(key:ts.AnyOf2<String, Array<String>>):Dynamic;
	/**
		Retrieves all data values in a new object.
	**/
	function getAll():{ };
	/**
		Queries the DataManager for the values of keys matching the given regular expression.
	**/
	function query(search:js.lib.RegExp):{ };
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
	function set(key:ts.AnyOf2<String, Dynamic>, data:Dynamic):DataManager;
	/**
		Increase a value for the given key. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		When the value is first set, a `setdata` event is emitted.
	**/
	function inc(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):DataManager;
	/**
		Toggle a boolean value for the given key. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		When the value is first set, a `setdata` event is emitted.
	**/
	function toggle(key:ts.AnyOf2<String, Dynamic>):DataManager;
	/**
		Passes all data entries to the given callback.
	**/
	function each(callback:global.DataEachCallback, ?context:Dynamic, args:haxe.extern.Rest<Dynamic>):DataManager;
	/**
		Merge the given object of key value pairs into this DataManager.
		
		Any newly created values will emit a `setdata` event. Any updated values (see the `overwrite` argument)
		will emit a `changedata` event.
	**/
	function merge(data:{ }, ?overwrite:Bool):DataManager;
	/**
		Remove the value for the given key.
		
		If the key is found in this Data Manager it is removed from the internal lists and a
		`removedata` event is emitted.
		
		You can also pass in an array of keys, in which case all keys in the array will be removed:
		
		```javascript
		this.data.remove([ 'gold', 'armor', 'health' ]);
		```
	**/
	function remove(key:ts.AnyOf2<String, Array<String>>):DataManager;
	/**
		Retrieves the data associated with the given 'key', deletes it from this Data Manager, then returns it.
	**/
	function pop(key:String):Dynamic;
	/**
		Determines whether the given key is set in this Data Manager.
		
		Please note that the keys are case-sensitive and must be valid JavaScript Object property strings.
		This means the keys `gold` and `Gold` are treated as two unique values within the Data Manager.
	**/
	function has(key:String):Bool;
	/**
		Freeze or unfreeze this Data Manager. A frozen Data Manager will block all attempts
		to create new values or update existing ones.
	**/
	function setFreeze(value:Bool):DataManager;
	/**
		Delete all data in this Data Manager and unfreeze it.
	**/
	function reset():DataManager;
	/**
		Destroy this data manager.
	**/
	function destroy():Void;
	/**
		Gets or sets the frozen state of this Data Manager.
		A frozen Data Manager will block all attempts to create new values or update existing ones.
	**/
	var freeze : Bool;
	/**
		Return the total number of entries in this Data Manager.
	**/
	var count : Float;
	static var prototype : DataManager;
}