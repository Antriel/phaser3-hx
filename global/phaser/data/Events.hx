package global.phaser.data;

@:native("Phaser.Data.Events") @valueModuleOnly extern class Events {
	/**
		The Change Data Event.
		
		This event is dispatched by a Data Manager when an item in the data store is changed.
		
		Game Objects with data enabled have an instance of a Data Manager under the `data` property. So, to listen for
		a change data event from a Game Object you would use: `sprite.data.on('changedata', listener)`.
		
		This event is dispatched for all items that change in the Data Manager.
		To listen for the change of a specific item, use the `CHANGE_DATA_KEY_EVENT` event.
	**/
	static final CHANGE_DATA : Dynamic;
	/**
		The Change Data Key Event.
		
		This event is dispatched by a Data Manager when an item in the data store is changed.
		
		Game Objects with data enabled have an instance of a Data Manager under the `data` property. So, to listen for
		the change of a specific data item from a Game Object you would use: `sprite.data.on('changedata-key', listener)`,
		where `key` is the unique string key of the data item. For example, if you have a data item stored called `gold`
		then you can listen for `sprite.data.on('changedata-gold')`.
	**/
	static final CHANGE_DATA_KEY : Dynamic;
	/**
		The Data Manager Destroy Event.
		
		The Data Manager will listen for the destroy event from its parent, and then close itself down.
	**/
	static final DESTROY : Dynamic;
	/**
		The Remove Data Event.
		
		This event is dispatched by a Data Manager when an item is removed from it.
		
		Game Objects with data enabled have an instance of a Data Manager under the `data` property. So, to listen for
		the removal of a data item on a Game Object you would use: `sprite.data.on('removedata', listener)`.
	**/
	static final REMOVE_DATA : Dynamic;
	/**
		The Set Data Event.
		
		This event is dispatched by a Data Manager when a new item is added to the data store.
		
		Game Objects with data enabled have an instance of a Data Manager under the `data` property. So, to listen for
		the addition of a new data item on a Game Object you would use: `sprite.data.on('setdata', listener)`.
	**/
	static final SET_DATA : Dynamic;
}