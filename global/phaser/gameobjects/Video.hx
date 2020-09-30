package global.phaser.gameobjects;

/**
	A Video Game Object.
	
	This Game Object is capable of handling playback of a previously loaded video from the Phaser Video Cache,
	or playing a video based on a given URL. Videos can be either local, or streamed.
	
	```javascript
	preload () {
	   this.load.video('pixar', 'nemo.mp4');
	}
	
	create () {
	   this.add.video(400, 300, 'pixar');
	}
	```
	
	To all intents and purposes, a video is a standard Game Object, just like a Sprite. And as such, you can do
	all the usual things to it, such as scaling, rotating, cropping, tinting, making interactive, giving a
	physics body, etc.
	
	Transparent videos are also possible via the WebM file format. Providing the video file has was encoded with
	an alpha channel, and providing the browser supports WebM playback (not all of them do), then it will render
	in-game with full transparency.
	
	### Autoplaying Videos
	
	Videos can only autoplay if the browser has been unlocked with an interaction, or satisfies the MEI settings.
	The policies that control autoplaying are vast and vary between browser.
	You can, ahd should, read more about it here: https://developer.mozilla.org/en-US/docs/Web/Media/Autoplay_guide
	
	If your video doesn't contain any audio, then set the `noAudio` parameter to `true` when the video is _loaded_,
	and it will often allow the video to play immediately:
	
	```javascript
	preload () {
	   this.load.video('pixar', 'nemo.mp4', 'loadeddata', false, true);
	}
	```
	
	The 5th parameter in the load call tells Phaser that the video doesn't contain any audio tracks. Video without
	audio can autoplay without requiring a user interaction. Video with audio cannot do this unless it satisfies
	the browsers MEI settings. See the MDN Autoplay Guide for further details.
	
	Note that due to a bug in IE11 you cannot play a video texture to a Sprite in WebGL. For IE11 force Canvas mode.
	
	More details about video playback and the supported media formats can be found on MDN:
	
	https://developer.mozilla.org/en-US/docs/Web/API/HTMLVideoElement
	https://developer.mozilla.org/en-US/docs/Web/Media/Formats
**/
@:native("Phaser.GameObjects.Video") extern class Video extends GameObject {
	function new(scene:global.phaser.Scene, x:Float, y:Float, ?key:String);
	/**
		A reference to the HTML Video Element this Video Game Object is playing.
		Will be `null` until a video is loaded for playback.
	**/
	var video : js.html.VideoElement;
	/**
		The Phaser Texture this Game Object is using to render the video to.
		Will be `null` until a video is loaded for playback.
	**/
	var videoTexture : global.phaser.textures.Texture;
	/**
		A reference to the TextureSource belong to the `videoTexture` Texture object.
		Will be `null` until a video is loaded for playback.
	**/
	var videoTextureSource : global.phaser.textures.TextureSource;
	/**
		A Phaser CanvasTexture instance that holds the most recent snapshot taken from the video.
		This will only be set if `snapshot` or `snapshotArea` have been called, and will be `null` until that point.
	**/
	var snapshotTexture : global.phaser.textures.CanvasTexture;
	/**
		If you have saved this video to a texture via the `saveTexture` method, this controls if the video
		is rendered with `flipY` in WebGL or not. You often need to set this if you wish to use the video texture
		as the input source for a shader. If you find your video is appearing upside down within a shader or
		custom pipeline, flip this property.
	**/
	var flipY : Bool;
	/**
		An internal flag holding the current state of the video lock, should document interaction be required
		before playback can begin.
	**/
	var touchLocked : Bool;
	/**
		Should the video auto play when document interaction is required and happens?
	**/
	var playWhenUnlocked : Bool;
	/**
		When starting playback of a video Phaser will monitor its `readyState` using a `setTimeout` call.
		The `setTimeout` happens once every `Video.retryInterval` ms. It will carry on monitoring the video
		state in this manner until the `retryLimit` is reached and then abort.
	**/
	var retryLimit : Float;
	/**
		The current retry attempt.
	**/
	var retry : Float;
	/**
		The number of ms between each retry while monitoring the ready state of a downloading video.
	**/
	var retryInterval : Float;
	/**
		An object containing in and out markers for sequence playback.
	**/
	var markers : Dynamic;
	/**
		Should the Video element that this Video is using, be removed from the DOM
		when this Video is destroyed?
	**/
	var removeVideoElementOnDestroy : Bool;
	/**
		Starts this video playing.
		
		If the video is already playing, or has been queued to play with `changeSource` then this method just returns.
		
		Videos can only autoplay if the browser has been unlocked. This happens if you have interacted with the browser, i.e.
		by clicking on it or pressing a key, or due to server settings. The policies that control autoplaying are vast and
		vary between browser. You can read more here: https://developer.mozilla.org/en-US/docs/Web/Media/Autoplay_guide
		
		If your video doesn't contain any audio, then set the `noAudio` parameter to `true` when the video is loaded,
		and it will often allow the video to play immediately:
		
		```javascript
		preload () {
		   this.load.video('pixar', 'nemo.mp4', 'loadeddata', false, true);
		}
		```
		
		The 5th parameter in the load call tells Phaser that the video doesn't contain any audio tracks. Video without
		audio can autoplay without requiring a user interaction. Video with audio cannot do this unless it satisfies
		the browsers MEI settings. See the MDN Autoplay Guide for details.
		
		If you need audio in your videos, then you'll have to consider the fact that the video cannot start playing until the
		user has interacted with the browser, into your game flow.
	**/
	function play(?loop:Bool, ?markerIn:Float, ?markerOut:Float):Video;
	/**
		This method allows you to change the source of the current video element. It works by first stopping the
		current video, if playing. Then deleting the video texture, if one has been created. Finally, it makes a
		new video texture and starts playback of the new source through the existing video element.
		
		The reason you may wish to do this is because videos that require interaction to unlock, remain in an unlocked
		state, even if you change the source of the video. By changing the source to a new video you avoid having to
		go through the unlock process again.
	**/
	function changeSource(key:String, ?autoplay:Bool, ?loop:Bool, ?markerIn:Float, ?markerOut:Float):Video;
	/**
		Adds a sequence marker to this video.
		
		Markers allow you to split a video up into sequences, delineated by a start and end time, given in seconds.
		
		You can then play back specific markers via the `playMarker` method.
		
		Note that marker timing is _not_ frame-perfect. You should construct your videos in such a way that you allow for
		plenty of extra padding before and after each sequence to allow for discrepancies in browser seek and currentTime accuracy.
		
		See https://github.com/w3c/media-and-entertainment/issues/4 for more details about this issue.
	**/
	function addMarker(key:String, markerIn:Float, markerOut:Float):Video;
	/**
		Plays a pre-defined sequence in this video.
		
		Markers allow you to split a video up into sequences, delineated by a start and end time, given in seconds and
		specified via the `addMarker` method.
		
		Note that marker timing is _not_ frame-perfect. You should construct your videos in such a way that you allow for
		plenty of extra padding before and after each sequence to allow for discrepancies in browser seek and currentTime accuracy.
		
		See https://github.com/w3c/media-and-entertainment/issues/4 for more details about this issue.
	**/
	function playMarker(key:String, ?loop:Bool):Video;
	/**
		Removes a previously set marker from this video.
		
		If the marker is currently playing it will _not_ stop playback.
	**/
	function removeMarker(key:String):Video;
	/**
		Takes a snapshot of the current frame of the video and renders it to a CanvasTexture object,
		which is then returned. You can optionally resize the grab by passing a width and height.
		
		This method returns a reference to the `Video.snapshotTexture` object. Calling this method
		multiple times will overwrite the previous snapshot with the most recent one.
	**/
	function snapshot(?width:Float, ?height:Float):global.phaser.textures.CanvasTexture;
	/**
		Takes a snapshot of the specified area of the current frame of the video and renders it to a CanvasTexture object,
		which is then returned. You can optionally resize the grab by passing a different `destWidth` and `destHeight`.
		
		This method returns a reference to the `Video.snapshotTexture` object. Calling this method
		multiple times will overwrite the previous snapshot with the most recent one.
	**/
	function snapshotArea(?x:Float, ?y:Float, ?srcWidth:Float, ?srcHeight:Float, ?destWidth:Float, ?destHeight:Float):global.phaser.textures.CanvasTexture;
	/**
		Stores a copy of this Videos `snapshotTexture` in the Texture Manager using the given key.
		
		This texture is created when the `snapshot` or `snapshotArea` methods are called.
		
		After doing this, any texture based Game Object, such as a Sprite, can use the contents of the
		snapshot by using the texture key:
		
		```javascript
		var vid = this.add.video(0, 0, 'intro');
		
		vid.snapshot();
		
		vid.saveSnapshotTexture('doodle');
		
		this.add.image(400, 300, 'doodle');
		```
		
		Updating the contents of the `snapshotTexture`, for example by calling `snapshot` again,
		will automatically update _any_ Game Object that is using it as a texture.
		Calling `saveSnapshotTexture` again will not save another copy of the same texture,
		it will just rename the existing one.
		
		By default it will create a single base texture. You can add frames to the texture
		by using the `Texture.add` method. After doing this, you can then allow Game Objects
		to use a specific frame.
	**/
	function saveSnapshotTexture(key:String):global.phaser.textures.CanvasTexture;
	/**
		Loads a Video from the given URL, ready for playback with the `Video.play` method.
		
		You can control at what point the browser determines the video as being ready for playback via
		the `loadEvent` parameter. See https://developer.mozilla.org/en-US/docs/Web/API/HTMLVideoElement
		for more details.
	**/
	function loadURL(url:String, ?loadEvent:String, ?noAudio:Bool):Video;
	/**
		Called when the video emits a `playing` event during load.
		
		This is only listened for if the browser doesn't support Promises.
	**/
	function playHandler():Void;
	/**
		Called when the video completes playback, i.e. reaches an `ended` state.
		
		This will never happen if the video is coming from a live stream, where the duration is `Infinity`.
	**/
	function completeHandler():Void;
	/**
		Called when the video emits a `timeUpdate` event during playback.
		
		This event is too slow and irregular to be used for actual video timing or texture updating,
		but we can use it to determine if a video has looped.
	**/
	function timeUpdateHandler():Void;
	/**
		Internal method that is called when enough video data has been received in order to create a texture
		from it. The texture is assigned to the `Video.videoTexture` property and given a base frame that
		encompases the whole video size.
	**/
	function updateTexture():Void;
	/**
		Returns the key of the currently played video, as stored in the Video Cache.
		If the video did not come from the cache this will return an empty string.
	**/
	function getVideoKey():String;
	/**
		Seeks to a given point in the video. The value is given as a float between 0 and 1,
		where 0 represents the start of the video and 1 represents the end.
		
		Seeking only works if the video has a duration, so will not work for live streams.
		
		When seeking begins, this video will emit a `seeking` event. When the video completes
		seeking (i.e. reaches its designated timestamp) it will emit a `seeked` event.
		
		If you wish to seek based on time instead, use the `Video.setCurrentTime` method.
	**/
	function seekTo(value:Float):Video;
	/**
		A double-precision floating-point value indicating the current playback time in seconds.
		If the media has not started to play and has not been seeked, this value is the media's initial playback time.
	**/
	function getCurrentTime():Float;
	/**
		Seeks to a given playback time in the video. The value is given in _seconds_ or as a string.
		
		Seeking only works if the video has a duration, so will not work for live streams.
		
		When seeking begins, this video will emit a `seeking` event. When the video completes
		seeking (i.e. reaches its designated timestamp) it will emit a `seeked` event.
		
		You can provide a string prefixed with either a `+` or a `-`, such as `+2.5` or `-2.5`.
		In this case it will seek to +/- the value given, relative to the _current time_.
		
		If you wish to seek based on a duration percentage instead, use the `Video.seekTo` method.
	**/
	function setCurrentTime(value:ts.AnyOf2<String, Float>):Video;
	/**
		Returns a boolean indicating if this Video is currently seeking, or not.
	**/
	function isSeeking():Bool;
	/**
		Returns the current progress of the video. Progress is defined as a value between 0 (the start)
		and 1 (the end).
		
		Progress can only be returned if the video has a duration, otherwise it will always return zero.
	**/
	function getProgress():Float;
	/**
		A double-precision floating-point value which indicates the duration (total length) of the media in seconds,
		on the media's timeline. If no media is present on the element, or the media is not valid, the returned value is NaN.
		
		If the media has no known end (such as for live streams of unknown duration, web radio, media incoming from WebRTC,
		and so forth), this value is +Infinity.
	**/
	function getDuration():Float;
	/**
		Sets the muted state of the currently playing video, if one is loaded.
	**/
	function setMute(?value:Bool):Video;
	/**
		Returns a boolean indicating if this Video is currently muted.
	**/
	function isMuted():Bool;
	/**
		Sets the paused state of the currently loaded video.
		
		If the video is playing, calling this method with `true` will pause playback.
		If the video is paused, calling this method with `false` will resume playback.
		
		If no video is loaded, this method does nothing.
	**/
	function setPaused(?value:Bool):Video;
	/**
		Returns a double indicating the audio volume, from 0.0 (silent) to 1.0 (loudest).
	**/
	function getVolume():Float;
	/**
		Sets the volume of the currently playing video.
		
		The value given is a double indicating the audio volume, from 0.0 (silent) to 1.0 (loudest).
	**/
	function setVolume(?value:Float):Video;
	/**
		Returns a double that indicates the rate at which the media is being played back.
	**/
	function getPlaybackRate():Float;
	/**
		Sets the playback rate of the current video.
		
		The value given is a double that indicates the rate at which the media is being played back.
	**/
	function setPlaybackRate(?rate:Float):Video;
	/**
		Returns a boolean which indicates whether the media element should start over when it reaches the end.
	**/
	function getLoop():Bool;
	/**
		Sets the loop state of the current video.
		
		The value given is a boolean which indicates whether the media element will start over when it reaches the end.
		
		Not all videos can loop, for example live streams.
		
		Please note that not all browsers support _seamless_ video looping for all encoding formats.
	**/
	function setLoop(?value:Bool):Video;
	/**
		Returns a boolean which indicates whether the video is currently playing.
	**/
	function isPlaying():Bool;
	/**
		Returns a boolean which indicates whether the video is currently paused.
	**/
	function isPaused():Bool;
	/**
		Stores this Video in the Texture Manager using the given key as a dynamic texture,
		which any texture-based Game Object, such as a Sprite, can use as its texture:
		
		```javascript
		var vid = this.add.video(0, 0, 'intro');
		
		vid.play();
		
		vid.saveTexture('doodle');
		
		this.add.image(400, 300, 'doodle');
		```
		
		The saved texture is automatically updated as the video plays. If you pause this video,
		or change its source, then the saved texture updates instantly.
		
		Calling `saveTexture` again will not save another copy of the same texture, it will just rename the existing one.
		
		By default it will create a single base texture. You can add frames to the texture
		by using the `Texture.add` method. After doing this, you can then allow Game Objects
		to use a specific frame.
		
		If you intend to save the texture so you can use it as the input for a Shader, you may need to set the
		`flipY` parameter to `true` if you find the video renders upside down in your shader.
	**/
	function saveTexture(key:String, ?flipY:Bool):global.phaser.textures.Texture;
	/**
		Stops the video playing and clears all internal event listeners.
		
		If you only wish to pause playback of the video, and resume it a later time, use the `Video.pause` method instead.
		
		If the video hasn't finished downloading, calling this method will not abort the download. To do that you need to
		call `destroy` instead.
	**/
	function stop():Video;
	/**
		Removes the Video element from the DOM by calling parentNode.removeChild on itself.
		
		Also removes the autoplay and src attributes and nulls the Video reference.
		
		You should not call this method if you were playing a video from the Video Cache that
		you wish to play again in your game, or if another Video object is also using the same
		video.
		
		If you loaded an external video via `Video.loadURL` then you should call this function
		to clear up once you are done with the instance.
	**/
	function removeVideoElement():Void;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():Video;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
		
		If your game is running under WebGL you can optionally specify four different alpha values, each of which
		correspond to the four corners of the Game Object. Under Canvas only the `topLeft` value given is used.
	**/
	function setAlpha(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):Video;
	/**
		The alpha value of the Game Object.
		
		This is a global value, impacting the entire Game Object, not just a region of it.
	**/
	var alpha : Float;
	/**
		The alpha value starting from the top-left of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaTopLeft : Float;
	/**
		The alpha value starting from the top-right of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaTopRight : Float;
	/**
		The alpha value starting from the bottom-left of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaBottomLeft : Float;
	/**
		The alpha value starting from the bottom-right of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaBottomRight : Float;
	/**
		Sets the Blend Mode being used by this Game Object.
		
		This can be a const, such as `Phaser.BlendModes.SCREEN`, or an integer, such as 4 (for Overlay)
		
		Under WebGL only the following Blend Modes are available:
		
		* ADD
		* MULTIPLY
		* SCREEN
		* ERASE
		
		Canvas has more available depending on browser support.
		
		You can also create your own custom Blend Modes in WebGL.
		
		Blend modes have different effects under Canvas and WebGL, and from browser to browser, depending
		on support. Blend Modes also cause a WebGL batch flush should it encounter a new blend mode. For these
		reasons try to be careful about the construction of your Scene and the frequency of which blend modes
		are used.
	**/
	var blendMode : ts.AnyOf2<String, global.phaser.BlendModes>;
	/**
		Sets the Blend Mode being used by this Game Object.
		
		This can be a const, such as `Phaser.BlendModes.SCREEN`, or an integer, such as 4 (for Overlay)
		
		Under WebGL only the following Blend Modes are available:
		
		* ADD
		* MULTIPLY
		* SCREEN
		* ERASE (only works when rendering to a framebuffer, like a Render Texture)
		
		Canvas has more available depending on browser support.
		
		You can also create your own custom Blend Modes in WebGL.
		
		Blend modes have different effects under Canvas and WebGL, and from browser to browser, depending
		on support. Blend Modes also cause a WebGL batch flush should it encounter a new blend mode. For these
		reasons try to be careful about the construction of your Scene and the frequency in which blend modes
		are used.
	**/
	function setBlendMode(value:ts.AnyOf2<String, global.phaser.BlendModes>):Video;
	/**
		The depth of this Game Object within the Scene.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	var depth : Float;
	/**
		The depth of this Game Object within the Scene.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	function setDepth(value:Float):Video;
	/**
		The horizontally flipped state of the Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	var flipX : Bool;
	/**
		Toggles the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function toggleFlipX():Video;
	/**
		Toggles the vertical flipped state of this Game Object.
	**/
	function toggleFlipY():Video;
	/**
		Sets the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlipX(value:Bool):Video;
	/**
		Sets the vertical flipped state of this Game Object.
	**/
	function setFlipY(value:Bool):Video;
	/**
		Sets the horizontal and vertical flipped state of this Game Object.
		
		A Game Object that is flipped will render inversed on the flipped axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlip(x:Bool, y:Bool):Video;
	/**
		Resets the horizontal and vertical flipped state of this Game Object back to their default un-flipped state.
	**/
	function resetFlip():Video;
	/**
		Gets the center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getCenter<O>(?output:O):O;
	/**
		Gets the top-left corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getTopLeft<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the top-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getTopCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the top-right corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getTopRight<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the left-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getLeftCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the right-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getRightCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-left corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getBottomLeft<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getBottomCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-right corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getBottomRight<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bounds of this Game Object, regardless of origin.
		The values are stored and returned in a Rectangle, or Rectangle-like, object.
	**/
	function getBounds<O>(?output:O):O;
	/**
		The Mask this Game Object is using during render.
	**/
	var mask : ts.AnyOf2<global.phaser.display.masks.BitmapMask, global.phaser.display.masks.GeometryMask>;
	/**
		Sets the mask that this Game Object will use to render with.
		
		The mask must have been previously created and can be either a GeometryMask or a BitmapMask.
		Note: Bitmap Masks only work on WebGL. Geometry Masks work on both WebGL and Canvas.
		
		If a mask is already set on this Game Object it will be immediately replaced.
		
		Masks are positioned in global space and are not relative to the Game Object to which they
		are applied. The reason for this is that multiple Game Objects can all share the same mask.
		
		Masks have no impact on physics or input detection. They are purely a rendering component
		that allows you to limit what is visible during the render pass.
	**/
	function setMask(mask:ts.AnyOf2<global.phaser.display.masks.BitmapMask, global.phaser.display.masks.GeometryMask>):Video;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):Video;
	/**
		Creates and returns a Bitmap Mask. This mask can be used by any Game Object,
		including this one.
		
		To create the mask you need to pass in a reference to a renderable Game Object.
		A renderable Game Object is one that uses a texture to render with, such as an
		Image, Sprite, Render Texture or BitmapText.
		
		If you do not provide a renderable object, and this Game Object has a texture,
		it will use itself as the object. This means you can call this method to create
		a Bitmap Mask from any renderable Game Object.
	**/
	function createBitmapMask(?renderable:GameObject):global.phaser.display.masks.BitmapMask;
	/**
		Creates and returns a Geometry Mask. This mask can be used by any Game Object,
		including this one.
		
		To create the mask you need to pass in a reference to a Graphics Game Object.
		
		If you do not provide a graphics object, and this Game Object is an instance
		of a Graphics object, then it will use itself to create the mask.
		
		This means you can call this method to create a Geometry Mask from any Graphics Game Object.
	**/
	function createGeometryMask(?graphics:Graphics):global.phaser.display.masks.GeometryMask;
	/**
		The horizontal origin of this Game Object.
		The origin maps the relationship between the size and position of the Game Object.
		The default value is 0.5, meaning all Game Objects are positioned based on their center.
		Setting the value to 0 means the position now relates to the left of the Game Object.
	**/
	var originX : Float;
	/**
		The vertical origin of this Game Object.
		The origin maps the relationship between the size and position of the Game Object.
		The default value is 0.5, meaning all Game Objects are positioned based on their center.
		Setting the value to 0 means the position now relates to the top of the Game Object.
	**/
	var originY : Float;
	/**
		The horizontal display origin of this Game Object.
		The origin is a normalized value between 0 and 1.
		The displayOrigin is a pixel value, based on the size of the Game Object combined with the origin.
	**/
	var displayOriginX : Float;
	/**
		The vertical display origin of this Game Object.
		The origin is a normalized value between 0 and 1.
		The displayOrigin is a pixel value, based on the size of the Game Object combined with the origin.
	**/
	var displayOriginY : Float;
	/**
		Sets the origin of this Game Object.
		
		The values are given in the range 0 to 1.
	**/
	function setOrigin(?x:Float, ?y:Float):Video;
	/**
		Sets the origin of this Game Object based on the Pivot values in its Frame.
	**/
	function setOriginFromFrame():Video;
	/**
		Sets the display origin of this Game Object.
		The difference between this and setting the origin is that you can use pixel values for setting the display origin.
	**/
	function setDisplayOrigin(?x:Float, ?y:Float):Video;
	/**
		Updates the Display Origin cached values internally stored on this Game Object.
		You don't usually call this directly, but it is exposed for edge-cases where you may.
	**/
	function updateDisplayOrigin():Video;
	/**
		The initial WebGL pipeline of this Game Object.
	**/
	var defaultPipeline : global.phaser.renderer.webgl.WebGLPipeline;
	/**
		The current WebGL pipeline of this Game Object.
	**/
	var pipeline : global.phaser.renderer.webgl.WebGLPipeline;
	/**
		Sets the initial WebGL Pipeline of this Game Object.
		This should only be called during the instantiation of the Game Object.
	**/
	function initPipeline(?pipelineName:String):Bool;
	/**
		Sets the active WebGL Pipeline of this Game Object.
	**/
	function setPipeline(pipelineName:String):Video;
	/**
		Resets the WebGL Pipeline of this Game Object back to the default it was created with.
	**/
	function resetPipeline():Bool;
	/**
		Gets the name of the WebGL Pipeline this Game Object is currently using.
	**/
	function getPipelineName():String;
	/**
		The horizontal scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorX : Float;
	/**
		The vertical scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorY : Float;
	/**
		Sets the scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	function setScrollFactor(x:Float, ?y:Float):Video;
	/**
		The native (un-scaled) width of this Game Object.
		
		Changing this value will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or use
		the `displayWidth` property.
	**/
	var width : Float;
	/**
		The native (un-scaled) height of this Game Object.
		
		Changing this value will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or use
		the `displayHeight` property.
	**/
	var height : Float;
	/**
		The displayed width of this Game Object.
		
		This value takes into account the scale factor.
		
		Setting this value will adjust the Game Object's scale property.
	**/
	var displayWidth : Float;
	/**
		The displayed height of this Game Object.
		
		This value takes into account the scale factor.
		
		Setting this value will adjust the Game Object's scale property.
	**/
	var displayHeight : Float;
	/**
		Sets the size of this Game Object to be that of the given Frame.
		
		This will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or call the
		`setDisplaySize` method, which is the same thing as changing the scale but allows you
		to do so by giving pixel values.
		
		If you have enabled this Game Object for input, changing the size will _not_ change the
		size of the hit area. To do this you should adjust the `input.hitArea` object directly.
	**/
	function setSizeToFrame(frame:global.phaser.textures.Frame):Video;
	/**
		Sets the internal size of this Game Object, as used for frame or physics body creation.
		
		This will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or call the
		`setDisplaySize` method, which is the same thing as changing the scale but allows you
		to do so by giving pixel values.
		
		If you have enabled this Game Object for input, changing the size will _not_ change the
		size of the hit area. To do this you should adjust the `input.hitArea` object directly.
	**/
	function setSize(width:Float, height:Float):Video;
	/**
		Sets the display size of this Game Object.
		
		Calling this will adjust the scale.
	**/
	function setDisplaySize(width:Float, height:Float):Video;
	/**
		The Texture this Game Object is using to render with.
	**/
	var texture : ts.AnyOf2<global.phaser.textures.Texture, global.phaser.textures.CanvasTexture>;
	/**
		The Texture Frame this Game Object is using to render with.
	**/
	var frame : global.phaser.textures.Frame;
	/**
		A boolean flag indicating if this Game Object is being cropped or not.
		You can toggle this at any time after `setCrop` has been called, to turn cropping on or off.
		Equally, calling `setCrop` with no arguments will reset the crop and disable it.
	**/
	var isCropped : Bool;
	/**
		Applies a crop to a texture based Game Object, such as a Sprite or Image.
		
		The crop is a rectangle that limits the area of the texture frame that is visible during rendering.
		
		Cropping a Game Object does not change its size, dimensions, physics body or hit area, it just
		changes what is shown when rendered.
		
		The crop coordinates are relative to the texture frame, not the Game Object, meaning 0 x 0 is the top-left.
		
		Therefore, if you had a Game Object that had an 800x600 sized texture, and you wanted to show only the left
		half of it, you could call `setCrop(0, 0, 400, 600)`.
		
		It is also scaled to match the Game Object scale automatically. Therefore a crop rect of 100x50 would crop
		an area of 200x100 when applied to a Game Object that had a scale factor of 2.
		
		You can either pass in numeric values directly, or you can provide a single Rectangle object as the first argument.
		
		Call this method with no arguments at all to reset the crop, or toggle the property `isCropped` to `false`.
		
		You should do this if the crop rectangle becomes the same size as the frame itself, as it will allow
		the renderer to skip several internal calculations.
	**/
	function setCrop(?x:ts.AnyOf2<Float, global.phaser.geom.Rectangle>, ?y:Float, ?width:Float, ?height:Float):Video;
	/**
		Sets the texture and frame this Game Object will use to render with.
		
		Textures are referenced by their string-based keys, as stored in the Texture Manager.
	**/
	function setTexture(key:String, ?frame:ts.AnyOf2<String, Float>):Video;
	/**
		Sets the frame this Game Object will use to render with.
		
		The Frame has to belong to the current Texture being used.
		
		It can be either a string or an index.
		
		Calling `setFrame` will modify the `width` and `height` properties of your Game Object.
		It will also change the `origin` if the Frame has a custom pivot point, as exported from packages like Texture Packer.
	**/
	function setFrame(frame:ts.AnyOf2<String, Float>, ?updateSize:Bool, ?updateOrigin:Bool):Video;
	/**
		Fill or additive?
	**/
	var tintFill : Bool;
	/**
		Clears all tint values associated with this Game Object.
		
		Immediately sets the color values back to 0xffffff and the tint type to 'additive',
		which results in no visible change to the texture.
	**/
	function clearTint():Video;
	/**
		Sets an additive tint on this Game Object.
		
		The tint works by taking the pixel color values from the Game Objects texture, and then
		multiplying it by the color value of the tint. You can provide either one color value,
		in which case the whole Game Object will be tinted in that color. Or you can provide a color
		per corner. The colors are blended together across the extent of the Game Object.
		
		To modify the tint color once set, either call this method again with new values or use the
		`tint` property to set all colors at once. Or, use the properties `tintTopLeft`, `tintTopRight,
		`tintBottomLeft` and `tintBottomRight` to set the corner color values independently.
		
		To remove a tint call `clearTint`.
		
		To swap this from being an additive tint to a fill based tint set the property `tintFill` to `true`.
	**/
	function setTint(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):Video;
	/**
		Sets a fill-based tint on this Game Object.
		
		Unlike an additive tint, a fill-tint literally replaces the pixel colors from the texture
		with those in the tint. You can use this for effects such as making a player flash 'white'
		if hit by something. You can provide either one color value, in which case the whole
		Game Object will be rendered in that color. Or you can provide a color per corner. The colors
		are blended together across the extent of the Game Object.
		
		To modify the tint color once set, either call this method again with new values or use the
		`tint` property to set all colors at once. Or, use the properties `tintTopLeft`, `tintTopRight,
		`tintBottomLeft` and `tintBottomRight` to set the corner color values independently.
		
		To remove a tint call `clearTint`.
		
		To swap this from being a fill-tint to an additive tint set the property `tintFill` to `false`.
	**/
	function setTintFill(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):Video;
	/**
		The tint value being applied to the top-left of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var tintTopLeft : Float;
	/**
		The tint value being applied to the top-right of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var tintTopRight : Float;
	/**
		The tint value being applied to the bottom-left of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var tintBottomLeft : Float;
	/**
		The tint value being applied to the bottom-right of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var tintBottomRight : Float;
	/**
		The tint value being applied to the whole of the Game Object.
		This property is a setter-only. Use the properties `tintTopLeft` etc to read the current tint value.
	**/
	var tint : Float;
	/**
		Does this Game Object have a tint applied to it or not?
	**/
	final isTinted : Bool;
	/**
		The x position of this Game Object.
	**/
	var x : Float;
	/**
		The y position of this Game Object.
	**/
	var y : Float;
	/**
		The z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#depth} instead.
	**/
	var z : Float;
	/**
		The w position of this Game Object.
	**/
	var w : Float;
	/**
		This is a special setter that allows you to set both the horizontal and vertical scale of this Game Object
		to the same value, at the same time. When reading this value the result returned is `(scaleX + scaleY) / 2`.
		
		Use of this property implies you wish the horizontal and vertical scales to be equal to each other. If this
		isn't the case, use the `scaleX` or `scaleY` properties instead.
	**/
	var scale : Float;
	/**
		The horizontal scale of this Game Object.
	**/
	var scaleX : Float;
	/**
		The vertical scale of this Game Object.
	**/
	var scaleY : Float;
	/**
		The angle of this Game Object as expressed in degrees.
		
		Phaser uses a right-hand clockwise rotation system, where 0 is right, 90 is down, 180/-180 is left
		and -90 is up.
		
		If you prefer to work in radians, see the `rotation` property instead.
	**/
	var angle : Float;
	/**
		The angle of this Game Object in radians.
		
		Phaser uses a right-hand clockwise rotation system, where 0 is right, PI/2 is down, +-PI is left
		and -PI/2 is up.
		
		If you prefer to work in degrees, see the `angle` property instead.
	**/
	var rotation : Float;
	/**
		Sets the position of this Game Object.
	**/
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):Video;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):Video;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):Video;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):Video;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(x:Float, ?y:Float):Video;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):Video;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):Video;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):Video;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):Video;
	/**
		Gets the local transform matrix for this Game Object.
	**/
	function getLocalTransformMatrix(?tempMatrix:global.phaser.gameobjects.components.TransformMatrix):global.phaser.gameobjects.components.TransformMatrix;
	/**
		Gets the world transform matrix for this Game Object, factoring in any parent Containers.
	**/
	function getWorldTransformMatrix(?tempMatrix:global.phaser.gameobjects.components.TransformMatrix, ?parentMatrix:global.phaser.gameobjects.components.TransformMatrix):global.phaser.gameobjects.components.TransformMatrix;
	/**
		Gets the sum total rotation of all of this Game Objects parent Containers.
		
		The returned value is in radians and will be zero if this Game Object has no parent container.
	**/
	function getParentRotation():Float;
	/**
		The visible state of the Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	var visible : Bool;
	/**
		Sets the visibility of this Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	function setVisible(value:Bool):Video;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):Video;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):Video;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):Video;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():Video;
	/**
		Allows you to store a key value pair within this Game Objects Data Manager.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		```javascript
		sprite.setData('name', 'Red Gem Stone');
		```
		
		You can also pass in an object of key value pairs as the first argument:
		
		```javascript
		sprite.setData({ name: 'Red Gem Stone', level: 2, owner: 'Link', gold: 50 });
		```
		
		To get a value back again you can call `getData`:
		
		```javascript
		sprite.getData('gold');
		```
		
		Or you can access the value directly via the `values` property, where it works like any other variable:
		
		```javascript
		sprite.data.values.gold += 50;
		```
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
		
		If the key already exists, a `changedata` event is emitted instead, along an event named after the key.
		For example, if you updated an existing key called `PlayerLives` then it would emit the event `changedata-PlayerLives`.
		These events will be emitted regardless if you use this method to set the value, or the direct `values` setter.
		
		Please note that the data keys are case-sensitive and must be valid JavaScript Object property strings.
		This means the keys `gold` and `Gold` are treated as two unique values within the Data Manager.
	**/
	function setData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Video;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Video;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:ts.AnyOf2<String, Dynamic>):Video;
	/**
		Pass this Game Object to the Input Manager to enable it for Input.
		
		Input works by using hit areas, these are nearly always geometric shapes, such as rectangles or circles, that act as the hit area
		for the Game Object. However, you can provide your own hit area shape and callback, should you wish to handle some more advanced
		input detection.
		
		If no arguments are provided it will try and create a rectangle hit area based on the texture frame the Game Object is using. If
		this isn't a texture-bound object, such as a Graphics or BitmapText object, this will fail, and you'll need to provide a specific
		shape for it to use.
		
		You can also provide an Input Configuration Object as the only argument to this method.
	**/
	function setInteractive(?shape:Dynamic, ?callback:global.phaser.types.input.HitAreaCallback, ?dropZone:Bool):Video;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():Video;
	/**
		If this Game Object has previously been enabled for input, this will queue it
		for removal, causing it to no longer be interactive. The removal happens on
		the next game step, it is not immediate.
		
		The Interactive Object that was assigned to this Game Object will be destroyed,
		removed from the Input Manager and cleared from this Game Object.
		
		If you wish to re-enable this Game Object at a later date you will need to
		re-create its InteractiveObject by calling `setInteractive` again.
		
		If you wish to only temporarily stop an object from receiving input then use
		`disableInteractive` instead, as that toggles the interactive state, where-as
		this erases it completely.
		
		If you wish to resize a hit area, don't remove and then set it as being
		interactive. Instead, access the hitarea object directly and resize the shape
		being used. I.e.: `sprite.input.hitArea.setSize(width, height)` (assuming the
		shape is a Rectangle, which it is by default.)
	**/
	function removeInteractive():Video;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Video;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Video;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Video;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Video;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Video;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Video;
	static var prototype : Video;
}