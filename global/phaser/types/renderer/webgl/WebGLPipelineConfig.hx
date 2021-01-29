package global.phaser.types.renderer.webgl;

typedef WebGLPipelineConfig = {
	/**
		The Phaser.Game instance that owns this pipeline.
	**/
	var game : global.phaser.Game;
	/**
		The name of the pipeline.
	**/
	@:optional
	var name : String;
	/**
		How the primitives are rendered. The default value is GL_TRIANGLES. Here is the full list of rendering primitives: (https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Constants).
	**/
	@:optional
	var topology : Float;
	/**
		The source code, as a string, for the vertex shader. If you need to assign multiple shaders, see the `shaders` property.
	**/
	@:optional
	var vertShader : String;
	/**
		The source code, as a string, for the fragment shader. Can include `%count%` and `%forloop%` declarations for multi-texture support. If you need to assign multiple shaders, see the `shaders` property.
	**/
	@:optional
	var fragShader : String;
	/**
		The number of quads to hold in the batch. Defaults to `RenderConfig.batchSize`. This amount * 6 gives the vertex capacity.
	**/
	@:optional
	var batchSize : Float;
	/**
		The size, in bytes, of a single entry in the vertex buffer. Defaults to Float32Array.BYTES_PER_ELEMENT * 6 + Uint8Array.BYTES_PER_ELEMENT * 4.
	**/
	@:optional
	var vertexSize : Float;
	/**
		An optional Array or Typed Array of pre-calculated vertices data that is copied into the vertex data.
	**/
	@:optional
	var vertices : ts.AnyOf2<Array<Float>, js.lib.Float32Array>;
	/**
		An array of shader attribute data. All shaders bound to this pipeline must use the same attributes.
	**/
	@:optional
	var attributes : WebGLPipelineAttributesConfig;
	/**
		An array of shaders, all of which are created for this one pipeline. Uses the `vertShader`, `fragShader`, `attributes` and `uniforms` properties of this object as defaults.
	**/
	@:optional
	var shaders : Array<WebGLPipelineShaderConfig>;
	/**
		Force the shader to use just a single sampler2d? Set for anything that extends the Single Pipeline.
	**/
	@:optional
	var forceZero : Bool;
	/**
		Create Render Targets for this pipeline. Can be a number, which determines the quantity, a boolean (sets quantity to 1), or an array of Render Target configuration objects.
	**/
	@:optional
	var renderTarget : ts.AnyOf3<Float, Bool, Array<RenderTargetConfig>>;
};