package global.phaser.cameras.scene2d;

@:native("Phaser.Cameras.Scene2D.Events") @valueModuleOnly extern class Events {
	/**
		The Destroy Camera Event.
		
		This event is dispatched by a Camera instance when it is destroyed by the Camera Manager.
	**/
	static final DESTROY : Dynamic;
	/**
		The Camera Fade In Complete Event.
		
		This event is dispatched by a Camera instance when the Fade In Effect completes.
		
		Listen to it from a Camera instance using `Camera.on('camerafadeincomplete', listener)`.
	**/
	static final FADE_IN_COMPLETE : Dynamic;
	/**
		The Camera Fade In Start Event.
		
		This event is dispatched by a Camera instance when the Fade In Effect starts.
		
		Listen to it from a Camera instance using `Camera.on('camerafadeinstart', listener)`.
	**/
	static final FADE_IN_START : Dynamic;
	/**
		The Camera Fade Out Complete Event.
		
		This event is dispatched by a Camera instance when the Fade Out Effect completes.
		
		Listen to it from a Camera instance using `Camera.on('camerafadeoutcomplete', listener)`.
	**/
	static final FADE_OUT_COMPLETE : Dynamic;
	/**
		The Camera Fade Out Start Event.
		
		This event is dispatched by a Camera instance when the Fade Out Effect starts.
		
		Listen to it from a Camera instance using `Camera.on('camerafadeoutstart', listener)`.
	**/
	static final FADE_OUT_START : Dynamic;
	/**
		The Camera Flash Complete Event.
		
		This event is dispatched by a Camera instance when the Flash Effect completes.
	**/
	static final FLASH_COMPLETE : Dynamic;
	/**
		The Camera Flash Start Event.
		
		This event is dispatched by a Camera instance when the Flash Effect starts.
	**/
	static final FLASH_START : Dynamic;
	/**
		The Camera Pan Complete Event.
		
		This event is dispatched by a Camera instance when the Pan Effect completes.
	**/
	static final PAN_COMPLETE : Dynamic;
	/**
		The Camera Pan Start Event.
		
		This event is dispatched by a Camera instance when the Pan Effect starts.
	**/
	static final PAN_START : Dynamic;
	/**
		The Camera Post-Render Event.
		
		This event is dispatched by a Camera instance after is has finished rendering.
		It is only dispatched if the Camera is rendering to a texture.
		
		Listen to it from a Camera instance using: `camera.on('postrender', listener)`.
	**/
	static final POST_RENDER : Dynamic;
	/**
		The Camera Pre-Render Event.
		
		This event is dispatched by a Camera instance when it is about to render.
		It is only dispatched if the Camera is rendering to a texture.
		
		Listen to it from a Camera instance using: `camera.on('prerender', listener)`.
	**/
	static final PRE_RENDER : Dynamic;
	/**
		The Camera Rotate Complete Event.
		
		This event is dispatched by a Camera instance when the Rotate Effect completes.
	**/
	static final ROTATE_COMPLETE : Dynamic;
	/**
		The Camera Rotate Start Event.
		
		This event is dispatched by a Camera instance when the Rotate Effect starts.
	**/
	static final ROTATE_START : Dynamic;
	/**
		The Camera Shake Complete Event.
		
		This event is dispatched by a Camera instance when the Shake Effect completes.
	**/
	static final SHAKE_COMPLETE : Dynamic;
	/**
		The Camera Shake Start Event.
		
		This event is dispatched by a Camera instance when the Shake Effect starts.
	**/
	static final SHAKE_START : Dynamic;
	/**
		The Camera Zoom Complete Event.
		
		This event is dispatched by a Camera instance when the Zoom Effect completes.
	**/
	static final ZOOM_COMPLETE : Dynamic;
	/**
		The Camera Zoom Start Event.
		
		This event is dispatched by a Camera instance when the Zoom Effect starts.
	**/
	static final ZOOM_START : Dynamic;
}