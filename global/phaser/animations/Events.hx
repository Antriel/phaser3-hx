package global.phaser.animations;

@:native("Phaser.Animations.Events") @valueModuleOnly extern class Events {
	/**
		The Add Animation Event.
		
		This event is dispatched when a new animation is added to the global Animation Manager.
		
		This can happen either as a result of an animation instance being added to the Animation Manager,
		or the Animation Manager creating a new animation directly.
	**/
	static final ADD_ANIMATION : Dynamic;
	/**
		The Animation Complete Event.
		
		This event is dispatched by an Animation instance when it completes, i.e. finishes playing or is manually stopped.
		
		Be careful with the volume of events this could generate. If a group of Sprites all complete the same
		animation at the same time, this event will invoke its handler for each one of them.
	**/
	static final ANIMATION_COMPLETE : Dynamic;
	/**
		The Animation Repeat Event.
		
		This event is dispatched when a currently playing animation repeats.
		
		The event is dispatched directly from the Animation object itself. Which means that listeners
		bound to this event will be invoked every time the Animation repeats, for every Game Object that may have it.
	**/
	static final ANIMATION_REPEAT : Dynamic;
	/**
		The Animation Restart Event.
		
		This event is dispatched by an Animation instance when it restarts.
		
		Be careful with the volume of events this could generate. If a group of Sprites all restart the same
		animation at the same time, this event will invoke its handler for each one of them.
	**/
	static final ANIMATION_RESTART : Dynamic;
	/**
		The Animation Start Event.
		
		This event is dispatched by an Animation instance when it starts playing.
		
		Be careful with the volume of events this could generate. If a group of Sprites all play the same
		animation at the same time, this event will invoke its handler for each one of them.
	**/
	static final ANIMATION_START : Dynamic;
	/**
		The Pause All Animations Event.
		
		This event is dispatched when the global Animation Manager is told to pause.
		
		When this happens all current animations will stop updating, although it doesn't necessarily mean
		that the game has paused as well.
	**/
	static final PAUSE_ALL : Dynamic;
	/**
		The Remove Animation Event.
		
		This event is dispatched when an animation is removed from the global Animation Manager.
	**/
	static final REMOVE_ANIMATION : Dynamic;
	/**
		The Resume All Animations Event.
		
		This event is dispatched when the global Animation Manager resumes, having been previously paused.
		
		When this happens all current animations will continue updating again.
	**/
	static final RESUME_ALL : Dynamic;
	/**
		The Sprite Animation Complete Event.
		
		This event is dispatched by a Sprite when an animation finishes playing on it.
		
		Listen for it on the Sprite using `sprite.on('animationcomplete', listener)`
		
		This same event is dispatched for all animations. To listen for a specific animation, use the `SPRITE_ANIMATION_KEY_COMPLETE` event.
	**/
	static final SPRITE_ANIMATION_COMPLETE : Dynamic;
	/**
		The Sprite Animation Key Complete Event.
		
		This event is dispatched by a Sprite when a specific animation finishes playing on it.
		
		Listen for it on the Sprite using `sprite.on('animationcomplete-key', listener)` where `key` is the key of
		the animation. For example, if you had an animation with the key 'explode' you should listen for `animationcomplete-explode`.
	**/
	static final SPRITE_ANIMATION_KEY_COMPLETE : Dynamic;
	/**
		The Sprite Animation Key Repeat Event.
		
		This event is dispatched by a Sprite when a specific animation repeats playing on it.
		
		Listen for it on the Sprite using `sprite.on('animationrepeat-key', listener)` where `key` is the key of
		the animation. For example, if you had an animation with the key 'explode' you should listen for `animationrepeat-explode`.
	**/
	static final SPRITE_ANIMATION_KEY_REPEAT : Dynamic;
	/**
		The Sprite Animation Key Restart Event.
		
		This event is dispatched by a Sprite when a specific animation restarts playing on it.
		
		Listen for it on the Sprite using `sprite.on('animationrestart-key', listener)` where `key` is the key of
		the animation. For example, if you had an animation with the key 'explode' you should listen for `animationrestart-explode`.
	**/
	static final SPRITE_ANIMATION_KEY_RESTART : Dynamic;
	/**
		The Sprite Animation Key Start Event.
		
		This event is dispatched by a Sprite when a specific animation starts playing on it.
		
		Listen for it on the Sprite using `sprite.on('animationstart-key', listener)` where `key` is the key of
		the animation. For example, if you had an animation with the key 'explode' you should listen for `animationstart-explode`.
	**/
	static final SPRITE_ANIMATION_KEY_START : Dynamic;
	/**
		The Sprite Animation Key Update Event.
		
		This event is dispatched by a Sprite when a specific animation playing on it updates. This happens when the animation changes frame,
		based on the animation frame rate and other factors like `timeScale` and `delay`.
		
		Listen for it on the Sprite using `sprite.on('animationupdate-key', listener)` where `key` is the key of
		the animation. For example, if you had an animation with the key 'explode' you should listen for `animationupdate-explode`.
	**/
	static final SPRITE_ANIMATION_KEY_UPDATE : Dynamic;
	/**
		The Sprite Animation Repeat Event.
		
		This event is dispatched by a Sprite when an animation repeats playing on it.
		
		Listen for it on the Sprite using `sprite.on('animationrepeat', listener)`
		
		This same event is dispatched for all animations. To listen for a specific animation, use the `SPRITE_ANIMATION_KEY_REPEAT` event.
	**/
	static final SPRITE_ANIMATION_REPEAT : Dynamic;
	/**
		The Sprite Animation Restart Event.
		
		This event is dispatched by a Sprite when an animation restarts playing on it.
		
		Listen for it on the Sprite using `sprite.on('animationrestart', listener)`
		
		This same event is dispatched for all animations. To listen for a specific animation, use the `SPRITE_ANIMATION_KEY_RESTART` event.
	**/
	static final SPRITE_ANIMATION_RESTART : Dynamic;
	/**
		The Sprite Animation Start Event.
		
		This event is dispatched by a Sprite when an animation starts playing on it.
		
		Listen for it on the Sprite using `sprite.on('animationstart', listener)`
		
		This same event is dispatched for all animations. To listen for a specific animation, use the `SPRITE_ANIMATION_KEY_START` event.
	**/
	static final SPRITE_ANIMATION_START : Dynamic;
	/**
		The Sprite Animation Update Event.
		
		This event is dispatched by a Sprite when an animation playing on it updates. This happens when the animation changes frame,
		based on the animation frame rate and other factors like `timeScale` and `delay`.
		
		Listen for it on the Sprite using `sprite.on('animationupdate', listener)`
		
		This same event is dispatched for all animations. To listen for a specific animation, use the `SPRITE_ANIMATION_KEY_UPDATE` event.
	**/
	static final SPRITE_ANIMATION_UPDATE : Dynamic;
}