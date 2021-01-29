package global.phaser.sound;

@:native("Phaser.Sound.Events") @valueModuleOnly extern class Events {
	/**
		The Sound Complete Event.
		
		This event is dispatched by both Web Audio and HTML5 Audio Sound objects when they complete playback.
		
		Listen to it from a Sound instance using `Sound.on('complete', listener)`, i.e.:
		
		```javascript
		var music = this.sound.add('key');
		music.on('complete', listener);
		music.play();
		```
	**/
	static final COMPLETE : Dynamic;
	/**
		The Audio Data Decoded All Event.
		
		This event is dispatched by the Web Audio Sound Manager as a result of calling the `decodeAudio` method,
		once all files passed to the method have been decoded (or errored).
		
		Use `Phaser.Sound.Events#DECODED` to listen for single sounds being decoded, and `DECODED_ALL` to
		listen for them all completing.
		
		Listen to it from the Sound Manager in a Scene using `this.sound.on('decodedall', listener)`, i.e.:
		
		```javascript
		this.sound.once('decodedall', handler);
		this.sound.decodeAudio([ audioFiles ]);
		```
	**/
	static final DECODED_ALL : Dynamic;
	/**
		The Audio Data Decoded Event.
		
		This event is dispatched by the Web Audio Sound Manager as a result of calling the `decodeAudio` method.
		
		Listen to it from the Sound Manager in a Scene using `this.sound.on('decoded', listener)`, i.e.:
		
		```javascript
		this.sound.on('decoded', handler);
		this.sound.decodeAudio(key, audioData);
		```
	**/
	static final DECODED : Dynamic;
	/**
		The Sound Destroy Event.
		
		This event is dispatched by both Web Audio and HTML5 Audio Sound objects when they are destroyed, either
		directly or via a Sound Manager.
		
		Listen to it from a Sound instance using `Sound.on('destroy', listener)`, i.e.:
		
		```javascript
		var music = this.sound.add('key');
		music.on('destroy', listener);
		music.destroy();
		```
	**/
	static final DESTROY : Dynamic;
	/**
		The Sound Detune Event.
		
		This event is dispatched by both Web Audio and HTML5 Audio Sound objects when their detune value changes.
		
		Listen to it from a Sound instance using `Sound.on('detune', listener)`, i.e.:
		
		```javascript
		var music = this.sound.add('key');
		music.on('detune', listener);
		music.play();
		music.setDetune(200);
		```
	**/
	static final DETUNE : Dynamic;
	/**
		The Sound Manager Global Detune Event.
		
		This event is dispatched by the Base Sound Manager, or more typically, an instance of the Web Audio Sound Manager,
		or the HTML5 Audio Manager. It is dispatched when the `detune` property of the Sound Manager is changed, which globally
		adjusts the detuning of all active sounds.
		
		Listen to it from a Scene using: `this.sound.on('rate', listener)`.
	**/
	static final GLOBAL_DETUNE : Dynamic;
	/**
		The Sound Manager Global Mute Event.
		
		This event is dispatched by the Sound Manager when its `mute` property is changed, either directly
		or via the `setMute` method. This changes the mute state of all active sounds.
		
		Listen to it from a Scene using: `this.sound.on('mute', listener)`.
	**/
	static final GLOBAL_MUTE : Dynamic;
	/**
		The Sound Manager Global Rate Event.
		
		This event is dispatched by the Base Sound Manager, or more typically, an instance of the Web Audio Sound Manager,
		or the HTML5 Audio Manager. It is dispatched when the `rate` property of the Sound Manager is changed, which globally
		adjusts the playback rate of all active sounds.
		
		Listen to it from a Scene using: `this.sound.on('rate', listener)`.
	**/
	static final GLOBAL_RATE : Dynamic;
	/**
		The Sound Manager Global Volume Event.
		
		This event is dispatched by the Sound Manager when its `volume` property is changed, either directly
		or via the `setVolume` method. This changes the volume of all active sounds.
		
		Listen to it from a Scene using: `this.sound.on('volume', listener)`.
	**/
	static final GLOBAL_VOLUME : Dynamic;
	/**
		The Sound Looped Event.
		
		This event is dispatched by both Web Audio and HTML5 Audio Sound objects when they loop during playback.
		
		Listen to it from a Sound instance using `Sound.on('looped', listener)`, i.e.:
		
		```javascript
		var music = this.sound.add('key');
		music.on('looped', listener);
		music.setLoop(true);
		music.play();
		```
		
		This is not to be confused with the [LOOP]{@linkcode Phaser.Sound.Events#event:LOOP} event, which only emits when the loop state of a Sound is changed.
	**/
	static final LOOPED : Dynamic;
	/**
		The Sound Loop Event.
		
		This event is dispatched by both Web Audio and HTML5 Audio Sound objects when their loop state is changed.
		
		Listen to it from a Sound instance using `Sound.on('loop', listener)`, i.e.:
		
		```javascript
		var music = this.sound.add('key');
		music.on('loop', listener);
		music.setLoop(true);
		```
		
		This is not to be confused with the [LOOPED]{@linkcode Phaser.Sound.Events#event:LOOPED} event, which emits each time a Sound loops during playback.
	**/
	static final LOOP : Dynamic;
	/**
		The Sound Mute Event.
		
		This event is dispatched by both Web Audio and HTML5 Audio Sound objects when their mute state changes.
		
		Listen to it from a Sound instance using `Sound.on('mute', listener)`, i.e.:
		
		```javascript
		var music = this.sound.add('key');
		music.on('mute', listener);
		music.play();
		music.setMute(true);
		```
	**/
	static final MUTE : Dynamic;
	/**
		The Sound Pan Event.
		
		This event is dispatched by both Web Audio and HTML5 Audio Sound objects when their pan changes.
		
		Listen to it from a Sound instance using `Sound.on('pan', listener)`, i.e.:
		
		```javascript
		var sound = this.sound.add('key');
		sound.on('pan', listener);
		sound.play();
		sound.setPan(0.5);
		```
	**/
	static final PAN : Dynamic;
	/**
		The Pause All Sounds Event.
		
		This event is dispatched by the Base Sound Manager, or more typically, an instance of the Web Audio Sound Manager,
		or the HTML5 Audio Manager. It is dispatched when the `pauseAll` method is invoked and after all current Sounds
		have been paused.
		
		Listen to it from a Scene using: `this.sound.on('pauseall', listener)`.
	**/
	static final PAUSE_ALL : Dynamic;
	/**
		The Sound Pause Event.
		
		This event is dispatched by both Web Audio and HTML5 Audio Sound objects when they are paused.
		
		Listen to it from a Sound instance using `Sound.on('pause', listener)`, i.e.:
		
		```javascript
		var music = this.sound.add('key');
		music.on('pause', listener);
		music.play();
		music.pause();
		```
	**/
	static final PAUSE : Dynamic;
	/**
		The Sound Play Event.
		
		This event is dispatched by both Web Audio and HTML5 Audio Sound objects when they are played.
		
		Listen to it from a Sound instance using `Sound.on('play', listener)`, i.e.:
		
		```javascript
		var music = this.sound.add('key');
		music.on('play', listener);
		music.play();
		```
	**/
	static final PLAY : Dynamic;
	/**
		The Sound Rate Change Event.
		
		This event is dispatched by both Web Audio and HTML5 Audio Sound objects when their rate changes.
		
		Listen to it from a Sound instance using `Sound.on('rate', listener)`, i.e.:
		
		```javascript
		var music = this.sound.add('key');
		music.on('rate', listener);
		music.play();
		music.setRate(0.5);
		```
	**/
	static final RATE : Dynamic;
	/**
		The Resume All Sounds Event.
		
		This event is dispatched by the Base Sound Manager, or more typically, an instance of the Web Audio Sound Manager,
		or the HTML5 Audio Manager. It is dispatched when the `resumeAll` method is invoked and after all current Sounds
		have been resumed.
		
		Listen to it from a Scene using: `this.sound.on('resumeall', listener)`.
	**/
	static final RESUME_ALL : Dynamic;
	/**
		The Sound Resume Event.
		
		This event is dispatched by both Web Audio and HTML5 Audio Sound objects when they are resumed from a paused state.
		
		Listen to it from a Sound instance using `Sound.on('resume', listener)`, i.e.:
		
		```javascript
		var music = this.sound.add('key');
		music.on('resume', listener);
		music.play();
		music.pause();
		music.resume();
		```
	**/
	static final RESUME : Dynamic;
	/**
		The Sound Seek Event.
		
		This event is dispatched by both Web Audio and HTML5 Audio Sound objects when they are seeked to a new position.
		
		Listen to it from a Sound instance using `Sound.on('seek', listener)`, i.e.:
		
		```javascript
		var music = this.sound.add('key');
		music.on('seek', listener);
		music.play();
		music.setSeek(5000);
		```
	**/
	static final SEEK : Dynamic;
	/**
		The Stop All Sounds Event.
		
		This event is dispatched by the Base Sound Manager, or more typically, an instance of the Web Audio Sound Manager,
		or the HTML5 Audio Manager. It is dispatched when the `stopAll` method is invoked and after all current Sounds
		have been stopped.
		
		Listen to it from a Scene using: `this.sound.on('stopall', listener)`.
	**/
	static final STOP_ALL : Dynamic;
	/**
		The Sound Stop Event.
		
		This event is dispatched by both Web Audio and HTML5 Audio Sound objects when they are stopped.
		
		Listen to it from a Sound instance using `Sound.on('stop', listener)`, i.e.:
		
		```javascript
		var music = this.sound.add('key');
		music.on('stop', listener);
		music.play();
		music.stop();
		```
	**/
	static final STOP : Dynamic;
	/**
		The Sound Manager Unlocked Event.
		
		This event is dispatched by the Base Sound Manager, or more typically, an instance of the Web Audio Sound Manager,
		or the HTML5 Audio Manager. It is dispatched during the update loop when the Sound Manager becomes unlocked. For
		Web Audio this is on the first user gesture on the page.
		
		Listen to it from a Scene using: `this.sound.on('unlocked', listener)`.
	**/
	static final UNLOCKED : Dynamic;
	/**
		The Sound Volume Event.
		
		This event is dispatched by both Web Audio and HTML5 Audio Sound objects when their volume changes.
		
		Listen to it from a Sound instance using `Sound.on('volume', listener)`, i.e.:
		
		```javascript
		var music = this.sound.add('key');
		music.on('volume', listener);
		music.play();
		music.setVolume(0.5);
		```
	**/
	static final VOLUME : Dynamic;
}