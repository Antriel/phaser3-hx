package global.phaser;

/**
	This class represents one single Leaderboard that belongs to a Facebook Instant Game.
	
	You do not need to instantiate this class directly, it will be created when you use the
	`getLeaderboard()` method of the main plugin.
**/
@:native("Phaser.FacebookInstantGamesLeaderboard") extern class FacebookInstantGamesLeaderboard extends global.phaser.events.EventEmitter {
	function new(plugin:FacebookInstantGamesPlugin, data:Dynamic);
	/**
		A reference to the Facebook Instant Games Plugin.
	**/
	var plugin : FacebookInstantGamesPlugin;
	/**
		An Instant Game leaderboard instance.
	**/
	var ref : Dynamic;
	/**
		The name of the leaderboard.
	**/
	var name : String;
	/**
		The ID of the context that the leaderboard is associated with, or null if the leaderboard is not tied to a particular context.
	**/
	var contextID : String;
	/**
		The total number of player entries in the leaderboard.
		This value defaults to zero. Populate it via the `getEntryCount()` method.
	**/
	var entryCount : Float;
	/**
		The players score object.
		This value defaults to `null`. Populate it via the `getPlayerScore()` method.
	**/
	var playerScore : global.LeaderboardScore;
	/**
		The scores in the Leaderboard from the currently requested range.
		This value defaults to an empty array. Populate it via the `getScores()` method.
		The contents of this array are reset each time `getScores()` is called.
	**/
	var scores : Array<global.LeaderboardScore>;
	/**
		Fetches the total number of player entries in the leaderboard.
		
		The data is requested in an async call, so the result isn't available immediately.
		
		When the call completes this Leaderboard will emit the `getentrycount` event along with the count and name of the Leaderboard.
	**/
	function getEntryCount():FacebookInstantGamesLeaderboard;
	/**
		Updates the player's score. If the player has an existing score, the old score will only be replaced if the new score is better than it.
		NOTE: If the leaderboard is associated with a specific context, the game must be in that context to set a score for the player.
		
		The data is requested in an async call, so the result isn't available immediately.
		
		When the call completes this Leaderboard will emit the `setscore` event along with the LeaderboardScore object and the name of the Leaderboard.
		
		If the save fails the event will send `null` as the score value.
	**/
	function setScore(score:Float, ?data:Dynamic):FacebookInstantGamesLeaderboard;
	/**
		Gets the players leaderboard entry and stores it in the `playerScore` property.
		
		The data is requested in an async call, so the result isn't available immediately.
		
		When the call completes this Leaderboard will emit the `getplayerscore` event along with the score and the name of the Leaderboard.
		
		If the player has not yet saved a score, the event will send `null` as the score value, and `playerScore` will be set to `null` as well.
	**/
	function getPlayerScore():FacebookInstantGamesLeaderboard;
	/**
		Retrieves a set of leaderboard entries, ordered by score ranking in the leaderboard.
		
		The data is requested in an async call, so the result isn't available immediately.
		
		When the call completes this Leaderboard will emit the `getscores` event along with an array of LeaderboardScore entries and the name of the Leaderboard.
	**/
	function getScores(?count:Float, ?offset:Float):FacebookInstantGamesLeaderboard;
	/**
		Retrieves a set of leaderboard entries, based on the current player's connected players (including the current player), ordered by local rank within the set of connected players.
		
		The data is requested in an async call, so the result isn't available immediately.
		
		When the call completes this Leaderboard will emit the `getconnectedscores` event along with an array of LeaderboardScore entries and the name of the Leaderboard.
	**/
	function getConnectedScores():FacebookInstantGamesLeaderboard;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):FacebookInstantGamesLeaderboard;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):FacebookInstantGamesLeaderboard;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):FacebookInstantGamesLeaderboard;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):FacebookInstantGamesLeaderboard;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):FacebookInstantGamesLeaderboard;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):FacebookInstantGamesLeaderboard;
	static var prototype : FacebookInstantGamesLeaderboard;
}