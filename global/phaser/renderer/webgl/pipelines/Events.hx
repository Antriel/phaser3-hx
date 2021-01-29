package global.phaser.renderer.webgl.pipelines;

@:native("Phaser.Renderer.WebGL.Pipelines.Events") @valueModuleOnly extern class Events {
	/**
		The WebGLPipeline After Flush Event.
		
		This event is dispatched by a WebGLPipeline right after it has issued a drawArrays command
		and cleared its vertex count.
	**/
	static final AFTER_FLUSH : Dynamic;
	/**
		The WebGLPipeline Before Flush Event.
		
		This event is dispatched by a WebGLPipeline right before it is about to
		flush and issue a bufferData and drawArrays command.
	**/
	static final BEFORE_FLUSH : Dynamic;
	/**
		The WebGLPipeline Bind Event.
		
		This event is dispatched by a WebGLPipeline when it is bound by the Pipeline Manager.
	**/
	static final BIND : Dynamic;
	/**
		The WebGLPipeline Boot Event.
		
		This event is dispatched by a WebGLPipeline when it has completed its `boot` phase.
	**/
	static final BOOT : Dynamic;
	/**
		The WebGLPipeline Destroy Event.
		
		This event is dispatched by a WebGLPipeline when it is starting its destroy process.
	**/
	static final DESTROY : Dynamic;
	/**
		The WebGLPipeline ReBind Event.
		
		This event is dispatched by a WebGLPipeline when it is re-bound by the Pipeline Manager.
	**/
	static final REBIND : Dynamic;
	/**
		The WebGLPipeline Resize Event.
		
		This event is dispatched by a WebGLPipeline when it is resized, usually as a result
		of the Renderer resizing.
	**/
	static final RESIZE : Dynamic;
}