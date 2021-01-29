package global.phaser.renderer;

@:native("Phaser.Renderer.Events") @valueModuleOnly extern class Events {
	/**
		The Post-Render Event.
		
		This event is dispatched by the Renderer when all rendering, for all cameras in all Scenes,
		has completed, but before any pending snap shots have been taken.
	**/
	static final POST_RENDER : Dynamic;
	/**
		The Pre-Render Event.
		
		This event is dispatched by the Phaser Renderer. This happens right at the start of the render
		process, after the context has been cleared, the scissors enabled (WebGL only) and everything has been
		reset ready for the render.
	**/
	static final PRE_RENDER : Dynamic;
	/**
		The Render Event.
		
		This event is dispatched by the Phaser Renderer for every camera in every Scene.
		
		It is dispatched before any of the children in the Scene have been rendered.
	**/
	static final RENDER : Dynamic;
	/**
		The Renderer Resize Event.
		
		This event is dispatched by the Phaser Renderer when it is resized, usually as a result
		of the Scale Manager resizing.
	**/
	static final RESIZE : Dynamic;
}