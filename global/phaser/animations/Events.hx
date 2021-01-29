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
		
		This event is dispatched by a Sprite when an animation playing on it completes playback.
		This happens when the animation gets to the end of its sequence, factoring in any delays
		or repeats it may have to process.
		
		An animation that is set to loop, or repeat forever, will never fire this event, because
		it never actually completes. If you need to handle this, listen for the `ANIMATION_STOP`
		event instead, as this is emitted when the animation is stopped directly.
		
		Listen for it on the Sprite using `sprite.on('animationcomplete', listener)`
		
		The animation event flow is as follows:
		
		1. `ANIMATION_START`
		2. `ANIMATION_UPDATE` (repeated for however many frames the animation has)
		3. `ANIMATION_REPEAT` (only if the animation is set to repeat, it then emits more update events after this)
		4. `ANIMATION_COMPLETE` (only if there is a finite, or zero, repeat count)
		5. `ANIMATION_COMPLETE_KEY` (only if there is a finite, or zero, repeat count)
		
		If the animation is stopped directly, the `ANIMATION_STOP` event is dispatched instead of `ANIMATION_COMPLETE`.
		
		If the animation is restarted while it is already playing, `ANIMATION_RESTART` is emitted.
	**/
	static final ANIMATION_COMPLETE : Dynamic;
	/**
		The Animation Complete Dynamic Key Event.
		
		This event is dispatched by a Sprite when an animation playing on it completes playback.
		This happens when the animation gets to the end of its sequence, factoring in any delays
		or repeats it may have to process.
		
		An animation that is set to loop, or repeat forever, will never fire this event, because
		it never actually completes. If you need to handle this, listen for the `ANIMATION_STOP`
		event instead, as this is emitted when the animation is stopped directly.
		
		The difference between this and the `ANIMATION_COMPLETE` event is that this one has a
		dynamic event name that contains the name of the animation within it. For example,
		if you had an animation called `explode` you could listen for the completion of that
		specific animation by using: `sprite.on('animationcomplete-explode', listener)`. Or, if you
		wish to use types: `sprite.on(Phaser.Animations.Events.ANIMATION_COMPLETE_KEY + 'explode', listener)`.
		
		The animation event flow is as follows:
		
		1. `ANIMATION_START`
		2. `ANIMATION_UPDATE` (repeated for however many frames the animation has)
		3. `ANIMATION_REPEAT` (only if the animation is set to repeat, it then emits more update events after this)
		4. `ANIMATION_COMPLETE` (only if there is a finite, or zero, repeat count)
		5. `ANIMATION_COMPLETE_KEY` (only if there is a finite, or zero, repeat count)
		
		If the animation is stopped directly, the `ANIMATION_STOP` event is dispatched instead of `ANIMATION_COMPLETE`.
		
		If the animation is restarted while it is already playing, `ANIMATION_RESTART` is emitted.
	**/
	static final ANIMATION_COMPLETE_KEY : Dynamic;
	/**
		The Animation Repeat Event.
		
		This event is dispatched by a Sprite when an animation repeats playing on it.
		This happens if the animation was created, or played, with a `repeat` value specified.
		
		An animation will repeat when it reaches the end of its sequence.
		
		Listen for it on the Sprite using `sprite.on('animationrepeat', listener)`
		
		The animation event flow is as follows:
		
		1. `ANIMATION_START`
		2. `ANIMATION_UPDATE` (repeated for however many frames the animation has)
		3. `ANIMATION_REPEAT` (only if the animation is set to repeat, it then emits more update events after this)
		4. `ANIMATION_COMPLETE` (only if there is a finite, or zero, repeat count)
		5. `ANIMATION_COMPLETE_KEY` (only if there is a finite, or zero, repeat count)
		
		If the animation is stopped directly, the `ANIMATION_STOP` event is dispatched instead of `ANIMATION_COMPLETE`.
		
		If the animation is restarted while it is already playing, `ANIMATION_RESTART` is emitted.
	**/
	static final ANIMATION_REPEAT : Dynamic;
	/**
		The Animation Restart Event.
		
		This event is dispatched by a Sprite when an animation restarts playing on it.
		This only happens when the `Sprite.anims.restart` method is called.
		
		Listen for it on the Sprite using `sprite.on('animationrestart', listener)`
		
		The animation event flow is as follows:
		
		1. `ANIMATION_START`
		2. `ANIMATION_UPDATE` (repeated for however many frames the animation has)
		3. `ANIMATION_REPEAT` (only if the animation is set to repeat, it then emits more update events after this)
		4. `ANIMATION_COMPLETE` (only if there is a finite, or zero, repeat count)
		5. `ANIMATION_COMPLETE_KEY` (only if there is a finite, or zero, repeat count)
		
		If the animation is stopped directly, the `ANIMATION_STOP` event is dispatched instead of `ANIMATION_COMPLETE`.
		
		If the animation is restarted while it is already playing, `ANIMATION_RESTART` is emitted.
	**/
	static final ANIMATION_RESTART : Dynamic;
	/**
		The Animation Start Event.
		
		This event is dispatched by a Sprite when an animation starts playing on it.
		This happens when the animation is played, factoring in any delay that may have been specified.
		This event happens after the delay has expired and prior to the first update event.
		
		Listen for it on the Sprite using `sprite.on('animationstart', listener)`
		
		The animation event flow is as follows:
		
		1. `ANIMATION_START`
		2. `ANIMATION_UPDATE` (repeated for however many frames the animation has)
		3. `ANIMATION_REPEAT` (only if the animation is set to repeat, it then emits more update events after this)
		4. `ANIMATION_COMPLETE` (only if there is a finite, or zero, repeat count)
		5. `ANIMATION_COMPLETE_KEY` (only if there is a finite, or zero, repeat count)
		
		If the animation is stopped directly, the `ANIMATION_STOP` event is dispatched instead of `ANIMATION_COMPLETE`.
		
		If the animation is restarted while it is already playing, `ANIMATION_RESTART` is emitted.
	**/
	static final ANIMATION_START : Dynamic;
	/**
		The Animation Stop Event.
		
		This event is dispatched by a Sprite when an animation is stopped on it. An animation
		will only be stopeed if a method such as `Sprite.stop` or `Sprite.anims.stopAfterDelay`
		is called. It can also be emitted if a new animation is started before the current one completes.
		
		Listen for it on the Sprite using `sprite.on('animationstop', listener)`
		
		The animation event flow is as follows:
		
		1. `ANIMATION_START`
		2. `ANIMATION_UPDATE` (repeated for however many frames the animation has)
		3. `ANIMATION_REPEAT` (only if the animation is set to repeat, it then emits more update events after this)
		4. `ANIMATION_COMPLETE` (only if there is a finite, or zero, repeat count)
		5. `ANIMATION_COMPLETE_KEY` (only if there is a finite, or zero, repeat count)
		
		If the animation is stopped directly, the `ANIMATION_STOP` event is dispatched instead of `ANIMATION_COMPLETE`.
		
		If the animation is restarted while it is already playing, `ANIMATION_RESTART` is emitted.
	**/
	static final ANIMATION_STOP : Dynamic;
	/**
		The Animation Update Event.
		
		This event is dispatched by a Sprite when an animation playing on it updates. This happens when the animation changes frame.
		An animation will change frame based on the frme rate and other factors like `timeScale` and `delay`. It can also change
		frame when stopped or restarted.
		
		Listen for it on the Sprite using `sprite.on('animationupdate', listener)`
		
		If an animation is playing faster than the game frame-rate can handle, it's entirely possible for it to emit several
		update events in a single game frame, so please be aware of this in your code. The **final** event received that frame
		is the one that is rendered to the game.
		
		The animation event flow is as follows:
		
		1. `ANIMATION_START`
		2. `ANIMATION_UPDATE` (repeated for however many frames the animation has)
		3. `ANIMATION_REPEAT` (only if the animation is set to repeat, it then emits more update events after this)
		4. `ANIMATION_COMPLETE` (only if there is a finite, or zero, repeat count)
		5. `ANIMATION_COMPLETE_KEY` (only if there is a finite, or zero, repeat count)
		
		If the animation is stopped directly, the `ANIMATION_STOP` event is dispatched instead of `ANIMATION_COMPLETE`.
		
		If the animation is restarted while it is already playing, `ANIMATION_RESTART` is emitted.
	**/
	static final ANIMATION_UPDATE : Dynamic;
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
}