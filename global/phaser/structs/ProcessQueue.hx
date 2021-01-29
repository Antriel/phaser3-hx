package global.phaser.structs;

/**
	A Process Queue maintains three internal lists.
	
	The `pending` list is a selection of items which are due to be made 'active' in the next update.
	The `active` list is a selection of items which are considered active and should be updated.
	The `destroy` list is a selection of items that were active and are awaiting being destroyed in the next update.
	
	When new items are added to a Process Queue they are put in the pending list, rather than being added
	immediately the active list. Equally, items that are removed are put into the destroy list, rather than
	being destroyed immediately. This allows the Process Queue to carefully process each item at a specific, fixed
	time, rather than at the time of the request from the API.
**/
@:native("Phaser.Structs.ProcessQueue") extern class ProcessQueue<T> extends global.phaser.events.EventEmitter {
	function new();
	/**
		If `true` only unique objects will be allowed in the queue.
	**/
	var checkQueue : Bool;
	/**
		Adds a new item to the Process Queue.
		
		The item is added to the pending list and made active in the next update.
	**/
	function add(item:T):ProcessQueue<T>;
	/**
		Removes an item from the Process Queue.
		
		The item is added to the pending destroy and fully removed in the next update.
	**/
	function remove(item:T):ProcessQueue<T>;
	/**
		Removes all active items from this Process Queue.
		
		All the items are marked as 'pending destroy' and fully removed in the next update.
	**/
	function removeAll():ProcessQueue<T>;
	/**
		Update this queue. First it will process any items awaiting destruction, and remove them.
		
		Then it will check to see if there are any items pending insertion, and move them to an
		active state. Finally, it will return a list of active items for further processing.
	**/
	function update():Array<T>;
	/**
		Returns the current list of active items.
		
		This method returns a reference to the active list array, not a copy of it.
		Therefore, be careful to not modify this array outside of the ProcessQueue.
	**/
	function getActive():Array<T>;
	/**
		The number of entries in the active list.
	**/
	final length : Float;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):ProcessQueue<T>;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):ProcessQueue<T>;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):ProcessQueue<T>;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):ProcessQueue<T>;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):ProcessQueue<T>;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):ProcessQueue<T>;
	static var prototype : ProcessQueue<Dynamic>;
}