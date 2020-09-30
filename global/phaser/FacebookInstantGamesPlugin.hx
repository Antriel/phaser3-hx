package global.phaser;

/**
	The Facebook Instant Games Plugin for Phaser 3 provides a seamless bridge between Phaser
	and the Facebook Instant Games API version 6.2.
	
	You can access this plugin via the `facebook` property in a Scene, i.e:
	
	```javascript
	this.facebook.getPlatform();
	```
	
	If this is unavailable please check to make sure you're using a build of Phaser that has
	this plugin within it. You can quickly check this by looking at the dev tools console
	header - the Phaser version number will have `-FB` after it if this plugin is loaded.
	
	If you are building your own version of Phaser then use this Webpack DefinePlugin flag:
	
	`"typeof PLUGIN_FBINSTANT": JSON.stringify(true)`
	
	You will find that every Instant Games API method has a mapping in this plugin.
	For a full list please consult either the plugin documentation, or the 6.2 SDK documentation
	at https://developers.facebook.com/docs/games/instant-games/sdk/fbinstant6.2
	
	Internally this plugin uses its own Data Manager to handle seamless user data updates and provides
	handy functions for advertisement displaying, opening share dialogs, logging, leaderboards, purchase API requests,
	loader integration and more.
	
	To get started with Facebook Instant Games you will need to register on Facebook and create a new Instant
	Game app that has its own unique app ID. Facebook have also provided a dashboard interface for setting up
	various features for your game, including leaderboards, ad requests and the payments API. There are lots
	of guides on the Facebook Developers portal to assist with setting these
	various systems up: https://developers.facebook.com/docs/games/instant-games/guides
	
	For more details follow the Quick Start guide here: https://developers.facebook.com/docs/games/instant-games
**/
@:native("Phaser.FacebookInstantGamesPlugin") extern class FacebookInstantGamesPlugin extends global.phaser.events.EventEmitter {
	function new(game:Game);
	/**
		A reference to the Phaser.Game instance.
	**/
	final game : Game;
	/**
		A Data Manager instance.
		It allows you to store, query and retrieve any key/value data you may need to store.
		It's also used internally by the plugin to store FBIG API data.
	**/
	var data : global.phaser.data.DataManager;
	/**
		Has the Facebook Instant Games API loaded yet?
		This is set automatically during the boot process.
	**/
	var hasLoaded : Bool;
	/**
		Is the Data Manager currently locked?
	**/
	var dataLocked : Bool;
	/**
		A list of the Facebook Instant Games APIs that are available,
		based on the given platform, context and user privacy settings.
		This value is populated automatically during boot.
	**/
	var supportedAPIs : Array<String>;
	/**
		Holds the entry point that the game was launched from.
		This value is populated automatically during boot.
	**/
	var entryPoint : String;
	/**
		An object that contains any data associated with the entry point that the game was launched from.
		The contents of the object are developer-defined, and can occur from entry points on different platforms.
		This will return null for older mobile clients, as well as when there is no data associated with the particular entry point.
		This value is populated automatically during boot.
	**/
	var entryPointData : Dynamic;
	/**
		A unique identifier for the current game context. This represents a specific context
		that the game is being played in (for example, a particular messenger conversation or facebook post).
		The identifier will be null if game is being played in a solo context.
		This value is populated automatically during boot.
	**/
	var contextID : String;
	/**
		The current context in which your game is running. This can be either `null` or
		one of:
		
		`POST` - The game is running inside of a Facebook post.
		`THREAD` - The game is running inside a Facebook Messenger thread.
		`GROUP` - The game is running inside a Facebook Group.
		`SOLO` - This is the default context, the player is the only participant.
		
		This value is populated automatically during boot.
	**/
	var contextType : String;
	/**
		The current locale.
		See https://origincache.facebook.com/developers/resources/?id=FacebookLocales.xml for a complete list of supported locale values.
		Use this to determine what languages the current game should be localized with.
		This value is populated automatically during boot.
	**/
	var locale : String;
	/**
		The platform on which the game is currently running, i.e. `IOS`.
		This value is populated automatically during boot.
	**/
	var platform : String;
	/**
		The string representation of the Facebook Instant Games SDK version being used.
		This value is populated automatically during boot.
	**/
	var version : String;
	/**
		Holds the id of the player. This is a string based ID, the same as `FBInstant.player.getID()`.
		This value is populated automatically during boot if the API is supported.
	**/
	var playerID : String;
	/**
		The player's localized display name.
		This value is populated automatically during boot if the API is supported.
	**/
	var playerName : String;
	/**
		A url to the player's public profile photo. The photo will always be a square, and with dimensions
		of at least 200x200. When rendering it in the game, the exact dimensions should never be assumed to be constant.
		It's recommended to always scale the image to a desired size before rendering.
		This value is populated automatically during boot if the API is supported.
	**/
	var playerPhotoURL : String;
	/**
		Whether a player can subscribe to the game bot or not.
	**/
	var playerCanSubscribeBot : Bool;
	/**
		Does the current platform and context allow for use of the payments API?
		Currently this is only available on Facebook.com and Android 6+.
	**/
	var paymentsReady : Bool;
	/**
		The set of products that are registered to the game.
	**/
	var catalog : Array<global.Product>;
	/**
		Contains all of the player's unconsumed purchases.
		The game must fetch the current player's purchases as soon as the client indicates that it is ready to perform payments-related operations,
		i.e. at game start. The game can then process and consume any purchases that are waiting to be consumed.
	**/
	var purchases : Array<global.Purchase>;
	/**
		Contains all of the leaderboard data, as populated by the `getLeaderboard()` method.
	**/
	var leaderboards : Array<FacebookInstantGamesLeaderboard>;
	/**
		Contains AdInstance objects, as created by the `preloadAds()` method.
	**/
	var ads : Array<global.AdInstance>;
	/**
		Call this method from your `Scene.preload` in order to sync the load progress
		of the Phaser Loader with the Facebook Instant Games loader display, i.e.:
		
		```javascript
		this.facebook.showLoadProgress(this);
		this.facebook.once('startgame', this.startGame, this);
		```
	**/
	function showLoadProgress(scene:Scene):FacebookInstantGamesPlugin;
	/**
		This method is called automatically when the game has finished loading,
		if you used the `showLoadProgress` method. If your game doesn't need to
		load any assets, or you're managing the load yourself, then call this
		method directly to start the API running.
		
		When the API has finished starting this plugin will emit a `startgame` event
		which you should listen for.
	**/
	function gameStarted():Void;
	/**
		Checks to see if a given Facebook Instant Games API is available or not.
	**/
	function checkAPI(api:String):Bool;
	/**
		Returns the unique identifier for the current game context. This represents a specific context
		that the game is being played in (for example, a particular messenger conversation or facebook post).
		The identifier will be null if game is being played in a solo context.
		
		It is only populated if `contextGetID` is in the list of supported APIs.
	**/
	function getID():String;
	/**
		Returns the current context in which your game is running. This can be either `null` or one of:
		
		`POST` - The game is running inside of a Facebook post.
		`THREAD` - The game is running inside a Facebook Messenger thread.
		`GROUP` - The game is running inside a Facebook Group.
		`SOLO` - This is the default context, the player is the only participant.
		
		It is only populated if `contextGetType` is in the list of supported APIs.
	**/
	function getType():String;
	/**
		Returns the current locale.
		See https://origincache.facebook.com/developers/resources/?id=FacebookLocales.xml for a complete list of supported locale values.
		Use this to determine what languages the current game should be localized with.
		It is only populated if `getLocale` is in the list of supported APIs.
	**/
	function getLocale():String;
	/**
		Returns the platform on which the game is currently running, i.e. `IOS`.
		It is only populated if `getPlatform` is in the list of supported APIs.
	**/
	function getPlatform():String;
	/**
		Returns the string representation of the Facebook Instant Games SDK version being used.
		It is only populated if `getSDKVersion` is in the list of supported APIs.
	**/
	function getSDKVersion():String;
	/**
		Returns the id of the player. This is a string based ID, the same as `FBInstant.player.getID()`.
		It is only populated if `playerGetID` is in the list of supported APIs.
	**/
	function getPlayerID():String;
	/**
		Returns the player's localized display name.
		It is only populated if `playerGetName` is in the list of supported APIs.
	**/
	function getPlayerName():String;
	/**
		Returns the url to the player's public profile photo. The photo will always be a square, and with dimensions
		of at least 200x200. When rendering it in the game, the exact dimensions should never be assumed to be constant.
		It's recommended to always scale the image to a desired size before rendering.
		It is only populated if `playerGetPhoto` is in the list of supported APIs.
	**/
	function getPlayerPhotoURL():String;
	/**
		Load the player's photo and store it in the Texture Manager, ready for use in-game.
		
		This method works by using a Scene Loader instance and then asking the Loader to
		retrieve the image.
		
		When complete the plugin will emit a `photocomplete` event, along with the key of the photo.
		
		```javascript
		this.facebook.loadPlayerPhoto(this, 'player').once('photocomplete', function (key) {
		   this.add.image(x, y, 'player');
		}, this);
		```
	**/
	function loadPlayerPhoto(scene:Scene, key:String):FacebookInstantGamesPlugin;
	/**
		Checks if the current player can subscribe to the game bot.
		
		It makes an async call to the API, so the result isn't available immediately.
		
		If they can subscribe, the `playerCanSubscribeBot` property is set to `true`
		and this plugin will emit the `cansubscribebot` event.
		
		If they cannot, i.e. it's not in the list of supported APIs, or the request
		was rejected, it will emit a `cansubscribebotfail` event instead.
	**/
	function canSubscribeBot():FacebookInstantGamesPlugin;
	/**
		Subscribes the current player to the game bot.
		
		It makes an async call to the API, so the result isn't available immediately.
		
		If they are successfully subscribed this plugin will emit the `subscribebot` event.
		
		If they cannot, i.e. it's not in the list of supported APIs, or the request
		was rejected, it will emit a `subscribebotfail` event instead.
	**/
	function subscribeBot():FacebookInstantGamesPlugin;
	/**
		Gets the associated data from the player based on the given key, or array of keys.
		
		The data is requested in an async call, so the result isn't available immediately.
		
		When the call completes the data is set into this plugins Data Manager and the
		`getdata` event will be emitted.
	**/
	function getData(keys:ts.AnyOf2<String, Array<String>>):FacebookInstantGamesPlugin;
	/**
		Set data to be saved to the designated cloud storage of the current player. The game can store up to 1MB of data for each unique player.
		
		The data save is requested in an async call, so the result isn't available immediately.
		
		Data managed via this plugins Data Manager instance is automatically synced with Facebook. However, you can call this
		method directly if you need to replace the data object directly.
		
		When the APIs `setDataAsync` call resolves it will emit the `savedata` event from this plugin. If the call fails for some
		reason it will emit `savedatafail` instead.
		
		The call resolving does not necessarily mean that the input has already been persisted. Rather, it means that the data was valid and
		has been scheduled to be saved. It also guarantees that all values that were set are now available in `getData`.
	**/
	function saveData(data:Dynamic):FacebookInstantGamesPlugin;
	/**
		Immediately flushes any changes to the player data to the designated cloud storage.
		This function is expensive, and should primarily be used for critical changes where persistence needs to be immediate
		and known by the game. Non-critical changes should rely on the platform to persist them in the background.
		NOTE: Calls to player.setDataAsync will be rejected while this function's result is pending.
		
		Data managed via this plugins Data Manager instance is automatically synced with Facebook. However, you can call this
		method directly if you need to flush the data directly.
		
		When the APIs `flushDataAsync` call resolves it will emit the `flushdata` event from this plugin. If the call fails for some
		reason it will emit `flushdatafail` instead.
	**/
	function flushData():FacebookInstantGamesPlugin;
	/**
		Retrieve stats from the designated cloud storage of the current player.
		
		The data is requested in an async call, so the result isn't available immediately.
		
		When the call completes the `getstats` event will be emitted along with the data object returned.
		
		If the call fails, i.e. it's not in the list of supported APIs, or the request was rejected,
		it will emit a `getstatsfail` event instead.
	**/
	function getStats(?keys:Array<String>):FacebookInstantGamesPlugin;
	/**
		Save the stats of the current player to the designated cloud storage.
		
		Stats in the Facebook Instant Games API are purely numerical values paired with a string-based key. Only numbers can be saved as stats,
		all other data types will be ignored.
		
		The data is requested in an async call, so the result isn't available immediately.
		
		When the call completes the `savestats` event will be emitted along with the data object returned.
		
		If the call fails, i.e. it's not in the list of supported APIs, or the request was rejected,
		it will emit a `savestatsfail` event instead.
	**/
	function saveStats(data:Dynamic):FacebookInstantGamesPlugin;
	/**
		Increment the stats of the current player and save them to the designated cloud storage.
		
		Stats in the Facebook Instant Games API are purely numerical values paired with a string-based key. Only numbers can be saved as stats,
		all other data types will be ignored.
		
		The data object provided for this call should contain offsets for how much to modify the stats by:
		
		```javascript
		this.facebook.incStats({
		     level: 1,
		     zombiesSlain: 17,
		     rank: -1
		});
		```
		
		The data is requested in an async call, so the result isn't available immediately.
		
		When the call completes the `incstats` event will be emitted along with the data object returned.
		
		If the call fails, i.e. it's not in the list of supported APIs, or the request was rejected,
		it will emit a `incstatsfail` event instead.
	**/
	function incStats(data:Dynamic):FacebookInstantGamesPlugin;
	/**
		Sets the data associated with the individual gameplay session for the current context.
		
		This function should be called whenever the game would like to update the current session data.
		
		This session data may be used to populate a variety of payloads, such as game play webhooks.
	**/
	function saveSession(data:Dynamic):FacebookInstantGamesPlugin;
	/**
		This invokes a dialog to let the user share specified content, either as a message in Messenger or as a post on the user's timeline.
		
		A blob of data can be attached to the share which every game session launched from the share will be able to access via the `this.entryPointData` property.
		
		This data must be less than or equal to 1000 characters when stringified.
		
		When this method is called you should consider your game paused. Listen out for the `resume` event from this plugin to know when the dialog has been closed.
		
		The user may choose to cancel the share action and close the dialog. The resulting `resume` event will be dispatched regardless if the user actually shared the content or not.
	**/
	function openShare(text:String, key:String, ?frame:String, ?sessionData:Dynamic):FacebookInstantGamesPlugin;
	/**
		This invokes a dialog to let the user invite a friend to play this game, either as a message in Messenger or as a post on the user's timeline.
		
		A blob of data can be attached to the share which every game session launched from the share will be able to access via the `this.entryPointData` property.
		
		This data must be less than or equal to 1000 characters when stringified.
		
		When this method is called you should consider your game paused. Listen out for the `resume` event from this plugin to know when the dialog has been closed.
		
		The user may choose to cancel the share action and close the dialog. The resulting `resume` event will be dispatched regardless if the user actually shared the content or not.
	**/
	function openInvite(text:String, key:String, ?frame:String, ?sessionData:Dynamic):FacebookInstantGamesPlugin;
	/**
		This invokes a dialog to let the user share specified content, either as a message in Messenger or as a post on the user's timeline.
		
		A blob of data can be attached to the share which every game session launched from the share will be able to access via the `this.entryPointData` property.
		
		This data must be less than or equal to 1000 characters when stringified.
		
		When this method is called you should consider your game paused. Listen out for the `resume` event from this plugin to know when the dialog has been closed.
		
		The user may choose to cancel the share action and close the dialog. The resulting `resume` event will be dispatched regardless if the user actually shared the content or not.
	**/
	function openRequest(text:String, key:String, ?frame:String, ?sessionData:Dynamic):FacebookInstantGamesPlugin;
	/**
		This invokes a dialog to let the user share specified content, either as a message in Messenger or as a post on the user's timeline.
		
		A blob of data can be attached to the share which every game session launched from the share will be able to access via the `this.entryPointData` property.
		
		This data must be less than or equal to 1000 characters when stringified.
		
		When this method is called you should consider your game paused. Listen out for the `resume` event from this plugin to know when the dialog has been closed.
		
		The user may choose to cancel the share action and close the dialog. The resulting `resume` event will be dispatched regardless if the user actually shared the content or not.
	**/
	function openChallenge(text:String, key:String, ?frame:String, ?sessionData:Dynamic):FacebookInstantGamesPlugin;
	/**
		This function determines whether the number of participants in the current game context is between a given minimum and maximum, inclusive.
		If one of the bounds is null only the other bound will be checked against.
		It will always return the original result for the first call made in a context in a given game play session.
		Subsequent calls, regardless of arguments, will return the answer to the original query until a context change occurs and the query result is reset.
	**/
	function isSizeBetween(?min:Float, ?max:Float):Dynamic;
	/**
		Request a switch into a specific context. If the player does not have permission to enter that context,
		or if the player does not provide permission for the game to enter that context, this will emit a `switchfail` event.
		
		Otherwise, the plugin will emit the `switch` event when the game has switched into the specified context.
	**/
	function switchContext(contextID:String):FacebookInstantGamesPlugin;
	/**
		Opens a context selection dialog for the player. If the player selects an available context,
		the client will attempt to switch into that context, and emit the `choose` event if successful.
		Otherwise, if the player exits the menu or the client fails to switch into the new context, the `choosefail` event will be emitted.
	**/
	function chooseContext(?options:global.ChooseContextConfig):FacebookInstantGamesPlugin;
	/**
		Attempts to create or switch into a context between a specified player and the current player.
		This plugin will emit the `create` event once the context switch is completed.
		If the API call fails, such as if the player listed is not a Connected Player of the current player or if the
		player does not provide permission to enter the new context, then the plugin will emit a 'createfail' event.
	**/
	function createContext(playerID:String):FacebookInstantGamesPlugin;
	/**
		Fetches an array of ConnectedPlayer objects containing information about active players
		(people who played the game in the last 90 days) that are connected to the current player.
		
		It makes an async call to the API, so the result isn't available immediately.
		
		If they are successfully subscribed this plugin will emit the `players` event along
		with the player data.
		
		If they cannot, i.e. it's not in the list of supported APIs, or the request
		was rejected, it will emit a `playersfail` event instead.
	**/
	function getPlayers():FacebookInstantGamesPlugin;
	/**
		Fetches the game's product catalog.
		
		It makes an async call to the API, so the result isn't available immediately.
		
		If they are successfully subscribed this plugin will emit the `getcatalog` event along
		with the catalog data.
		
		If they cannot, i.e. it's not in the list of supported APIs, or the request
		was rejected, it will emit a `getcatalogfail` event instead.
	**/
	function getCatalog():FacebookInstantGamesPlugin;
	/**
		Fetches a single Product from the game's product catalog.
		
		The product catalog must have been populated using `getCatalog` prior to calling this method.
		
		Use this to look-up product details based on a purchase list.
	**/
	function getProduct(productID:String):global.Product;
	/**
		Begins the purchase flow for a specific product.
		
		It makes an async call to the API, so the result isn't available immediately.
		
		If they are successfully subscribed this plugin will emit the `purchase` event along
		with the purchase data.
		
		If they cannot, i.e. it's not in the list of supported APIs, or the request
		was rejected, it will emit a `purchasefail` event instead.
	**/
	function purchase(productID:String, ?developerPayload:String):FacebookInstantGamesPlugin;
	/**
		Fetches all of the player's unconsumed purchases. The game must fetch the current player's purchases
		as soon as the client indicates that it is ready to perform payments-related operations,
		i.e. at game start. The game can then process and consume any purchases that are waiting to be consumed.
		
		It makes an async call to the API, so the result isn't available immediately.
		
		If they are successfully subscribed this plugin will emit the `getpurchases` event along
		with the purchase data.
		
		If they cannot, i.e. it's not in the list of supported APIs, or the request
		was rejected, it will emit a `getpurchasesfail` event instead.
	**/
	function getPurchases():FacebookInstantGamesPlugin;
	/**
		Consumes a specific purchase belonging to the current player. Before provisioning a product's effects to the player,
		the game should request the consumption of the purchased product. Once the purchase is successfully consumed,
		the game should immediately provide the player with the effects of their purchase.
		
		It makes an async call to the API, so the result isn't available immediately.
		
		If they are successfully subscribed this plugin will emit the `consumepurchase` event along
		with the purchase data.
		
		If they cannot, i.e. it's not in the list of supported APIs, or the request
		was rejected, it will emit a `consumepurchasefail` event instead.
	**/
	function consumePurchase(purchaseToken:String):FacebookInstantGamesPlugin;
	/**
		Informs Facebook of a custom update that occurred in the game.
		This will temporarily yield control to Facebook and Facebook will decide what to do based on what the update is.
		Once Facebook returns control to the game the plugin will emit an `update` or `updatefail` event.
		
		It makes an async call to the API, so the result isn't available immediately.
		
		The `text` parameter is an update payload with the following structure:
		
		```
		text: {
		     default: 'X just invaded Y\'s village!',
		     localizations: {
		         ar_AR: 'X \u0641\u0642\u0637 \u063A\u0632\u062A ' +
		         '\u0642\u0631\u064A\u0629 Y!',
		         en_US: 'X just invaded Y\'s village!',
		         es_LA: '\u00A1X acaba de invadir el pueblo de Y!',
		     }
		}
		```
	**/
	function update(cta:String, text:Dynamic, key:String, frame:ts.AnyOf2<String, Float>, template:String, updateData:Dynamic):FacebookInstantGamesPlugin;
	/**
		Informs Facebook of a leaderboard update that occurred in the game.
		This will temporarily yield control to Facebook and Facebook will decide what to do based on what the update is.
		Once Facebook returns control to the game the plugin will emit an `update` or `updatefail` event.
		
		It makes an async call to the API, so the result isn't available immediately.
		
		The `text` parameter is an update payload with the following structure:
		
		```
		text: {
		     default: 'X just invaded Y\'s village!',
		     localizations: {
		         ar_AR: 'X \u0641\u0642\u0637 \u063A\u0632\u062A ' +
		         '\u0642\u0631\u064A\u0629 Y!',
		         en_US: 'X just invaded Y\'s village!',
		         es_LA: '\u00A1X acaba de invadir el pueblo de Y!',
		     }
		}
		```
	**/
	function updateLeaderboard(cta:String, text:Dynamic, key:String, frame:ts.AnyOf2<String, Float>, template:String, updateData:Dynamic):FacebookInstantGamesPlugin;
	/**
		Request that the client switch to a different Instant Game.
		
		It makes an async call to the API, so the result isn't available immediately.
		
		If the game switches successfully this plugin will emit the `switchgame` event and the client will load the new game.
		
		If they cannot, i.e. it's not in the list of supported APIs, or the request
		was rejected, it will emit a `switchgamefail` event instead.
	**/
	function switchGame(appID:String, ?data:Dynamic):FacebookInstantGamesPlugin;
	/**
		Prompts the user to create a shortcut to the game if they are eligible to.
		Can only be called once per session.
		
		It makes an async call to the API, so the result isn't available immediately.
		
		If the user choose to create a shortcut this plugin will emit the `shortcutcreated` event.
		
		If they cannot, i.e. it's not in the list of supported APIs, or the request
		was rejected, it will emit a `shortcutcreatedfail` event instead.
	**/
	function createShortcut():FacebookInstantGamesPlugin;
	/**
		Quits the game.
	**/
	function quit():Void;
	/**
		Log an app event with FB Analytics.
		
		See https://developers.facebook.com/docs/javascript/reference/v2.8#app_events for more details about FB Analytics.
	**/
	function log(name:String, ?value:Float, ?params:Dynamic):FacebookInstantGamesPlugin;
	/**
		Attempt to create an instance of an interstitial ad.
		
		If the instance is created successfully then the ad is preloaded ready for display in-game via the method `showAd()`.
		
		If the ad loads it will emit the `adloaded` event, passing the AdInstance as the only parameter.
		
		If the ad cannot be displayed because there was no inventory to fill it, it will emit the `adsnofill` event.
	**/
	function preloadAds(placementID:ts.AnyOf2<String, Array<String>>):FacebookInstantGamesPlugin;
	/**
		Attempt to create an instance of an rewarded video ad.
		
		If the instance is created successfully then the ad is preloaded ready for display in-game via the method `showVideo()`.
		
		If the ad loads it will emit the `adloaded` event, passing the AdInstance as the only parameter.
		
		If the ad cannot be displayed because there was no inventory to fill it, it will emit the `adsnofill` event.
	**/
	function preloadVideoAds(placementID:ts.AnyOf2<String, Array<String>>):FacebookInstantGamesPlugin;
	/**
		Displays a previously loaded interstitial ad.
		
		If the ad is successfully displayed this plugin will emit the `adfinished` event, with the AdInstance object as its parameter.
		
		If the ad cannot be displayed, it will emit the `adsnotloaded` event.
	**/
	function showAd(placementID:String):FacebookInstantGamesPlugin;
	/**
		Displays a previously loaded interstitial video ad.
		
		If the ad is successfully displayed this plugin will emit the `adfinished` event, with the AdInstance object as its parameter.
		
		If the ad cannot be displayed, it will emit the `adsnotloaded` event.
	**/
	function showVideo(placementID:String):FacebookInstantGamesPlugin;
	/**
		Attempts to match the current player with other users looking for people to play with.
		If successful, a new Messenger group thread will be created containing the matched players and the player will
		be context switched to that thread. This plugin will also dispatch the `matchplayer` event, containing the new context ID and Type.
		
		The default minimum and maximum number of players in one matched thread are 2 and 20 respectively,
		depending on how many players are trying to get matched around the same time.
		
		The values can be changed in `fbapp-config.json`. See the Bundle Config documentation for documentation about `fbapp-config.json`.
	**/
	function matchPlayer(?matchTag:String, ?switchImmediately:Bool):FacebookInstantGamesPlugin;
	/**
		Fetch a specific leaderboard belonging to this Instant Game.
		
		The data is requested in an async call, so the result isn't available immediately.
		
		When the call completes the `getleaderboard` event will be emitted along with a Leaderboard object instance.
	**/
	function getLeaderboard(name:String):FacebookInstantGamesPlugin;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):FacebookInstantGamesPlugin;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):FacebookInstantGamesPlugin;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):FacebookInstantGamesPlugin;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):FacebookInstantGamesPlugin;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):FacebookInstantGamesPlugin;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):FacebookInstantGamesPlugin;
	static var prototype : FacebookInstantGamesPlugin;
}