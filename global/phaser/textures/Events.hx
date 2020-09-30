package global.phaser.textures;

@:native("Phaser.Textures.Events") @valueModuleOnly extern class Events {
	/**
		The Texture Add Event.
		
		This event is dispatched by the Texture Manager when a texture is added to it.
		
		Listen to this event from within a Scene using: `this.textures.on('addtexture', listener)`.
	**/
	static final ADD : Dynamic;
	/**
		The Texture Load Error Event.
		
		This event is dispatched by the Texture Manager when a texture it requested to load failed.
		This only happens when base64 encoded textures fail. All other texture types are loaded via the Loader Plugin.
		
		Listen to this event from within a Scene using: `this.textures.on('onerror', listener)`.
	**/
	static final ERROR : Dynamic;
	/**
		The Texture Load Event.
		
		This event is dispatched by the Texture Manager when a texture has finished loading on it.
		This only happens for base64 encoded textures. All other texture types are loaded via the Loader Plugin.
		
		Listen to this event from within a Scene using: `this.textures.on('onload', listener)`.
		
		This event is dispatched after the [ADD]{@linkcode Phaser.Textures.Events#event:ADD} event.
	**/
	static final LOAD : Dynamic;
	/**
		This internal event signifies that the Texture Manager is now ready and the Game can continue booting.
		
		When a Phaser Game instance is booting for the first time, the Texture Manager has to wait on a couple of non-blocking
		async events before it's fully ready to carry on. When those complete the Texture Manager emits this event via the Game
		instance, which tells the Game to carry on booting.
	**/
	static final READY : Dynamic;
	/**
		The Texture Remove Event.
		
		This event is dispatched by the Texture Manager when a texture is removed from it.
		
		Listen to this event from within a Scene using: `this.textures.on('removetexture', listener)`.
		
		If you have any Game Objects still using the removed texture, they will start throwing
		errors the next time they try to render. Be sure to clear all use of the texture in this event handler.
	**/
	static final REMOVE : Dynamic;
}