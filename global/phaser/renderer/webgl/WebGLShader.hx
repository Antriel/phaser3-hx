package global.phaser.renderer.webgl;

/**
	Instances of the WebGLShader class belong to the WebGL Pipeline classes. When the pipeline is
	created it will create an instance of this class for each one of its shaders, as defined in
	the pipeline configuration.
	
	This class encapsulates everything needed to manage a shader in a pipeline, including the
	shader attributes and uniforms, as well as lots of handy methods such as `set2f`, for setting
	uniform values on this shader.
	
	Typically, you do not create an instance of this class directly, as it works in unison with
	the pipeline to which it belongs. You can gain access to this class via a pipeline's `shaders`
	array, post-creation.
**/
@:native("Phaser.Renderer.WebGL.WebGLShader") extern class WebGLShader {
	function new(pipeline:WebGLPipeline, name:String, vertexShader:String, fragmentShader:String, attributes:Array<global.phaser.types.renderer.webgl.WebGLPipelineAttributesConfig>);
	/**
		A reference to the WebGLPipeline that owns this Shader.
		
		A Shader class can only belong to a single pipeline.
	**/
	var pipeline : WebGLPipeline;
	/**
		The name of this shader.
	**/
	var name : String;
	/**
		A reference to the WebGLRenderer instance.
	**/
	var renderer : WebGLRenderer;
	/**
		A reference to the WebGL Rendering Context the WebGL Renderer is using.
	**/
	var gl : js.html.webgl.RenderingContext;
	/**
		The WebGLProgram created from the vertex and fragment shaders.
	**/
	var program : js.html.webgl.Program;
	/**
		Array of objects that describe the vertex attributes.
	**/
	var attributes : Array<global.phaser.types.renderer.webgl.WebGLPipelineAttribute>;
	/**
		The amount of vertex attribute components of 32 bit length.
	**/
	var vertexComponentCount : Float;
	/**
		The size, in bytes, of a single vertex.
		
		This is derived by adding together all of the vertex attributes.
		
		For example, the Multi Pipeline has the following attributes:
		
		inPosition - (size 2 x gl.FLOAT) = 8
		inTexCoord - (size 2 x gl.FLOAT) = 8
		inTexId - (size 1 x gl.FLOAT) = 4
		inTintEffect - (size 1 x gl.FLOAT) = 4
		inTint - (size 4 x gl.UNSIGNED_BYTE) = 4
		
		The total, in this case, is 8 + 8 + 4 + 4 + 4 = 28.
		
		This is calculated automatically during the `createAttributes` method.
	**/
	final vertexSize : Float;
	/**
		The active uniforms that this shader has.
		
		This is an object that maps the uniform names to their WebGL location and cached values.
		
		It is populated automatically via the `createUniforms` method.
	**/
	var uniforms : global.phaser.types.renderer.webgl.WebGLPipelineUniformsConfig;
	/**
		Takes the vertex attributes config and parses it, creating the resulting array that is stored
		in this shaders `attributes` property, calculating the offset, normalization and location
		in the process.
		
		Calling this method resets `WebGLShader.attributes`, `WebGLShader.vertexSize` and
		`WebGLShader.vertexComponentCount`.
		
		It is called automatically when this class is created, but can be called manually if required.
	**/
	function createAttributes(attributes:Array<global.phaser.types.renderer.webgl.WebGLPipelineAttributesConfig>):Void;
	/**
		Sets the program this shader uses as being the active shader in the WebGL Renderer.
		
		This method is called every time the parent pipeline is made the current active pipeline.
	**/
	function bind(?setAttributes:Bool, ?flush:Bool):WebGLShader;
	/**
		Sets the program this shader uses as being the active shader in the WebGL Renderer.
		
		Then resets all of the attribute pointers.
	**/
	function rebind():WebGLShader;
	/**
		Sets the vertex attribute pointers.
		
		This should only be called after the vertex buffer has been bound.
		
		It is called automatically during the `bind` method.
	**/
	function setAttribPointers(?reset:Bool):WebGLShader;
	/**
		Sets up the `WebGLShader.uniforms` object, populating it with the names
		and locations of the shader uniforms this shader requires.
		
		It works by first calling `gl.getProgramParameter(program, gl.ACTIVE_UNIFORMS)` to
		find out how many active uniforms this shader has. It then iterates through them,
		calling `gl.getActiveUniform` to get the WebGL Active Info from each one. Finally,
		the name and location are stored in the local array.
		
		This method is called automatically when this class is created.
	**/
	function createUniforms():WebGLShader;
	/**
		Checks to see if the given uniform name exists and is active in this shader.
	**/
	function hasUniform(name:String):Bool;
	/**
		Resets the cached values of the given uniform.
	**/
	function resetUniform(name:String):WebGLShader;
	/**
		Sets the given uniform value/s based on the name and GL function.
		
		This method is called internally by other methods such as `set1f` and `set3iv`.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function setUniform1(setter:haxe.Constraints.Function, name:String, value1:ts.AnyOf4<Float, Bool, Array<Float>, js.lib.Float32Array>):WebGLShader;
	/**
		Sets the given uniform value/s based on the name and GL function.
		
		This method is called internally by other methods such as `set1f` and `set3iv`.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function setUniform2(setter:haxe.Constraints.Function, name:String, value1:ts.AnyOf4<Float, Bool, Array<Float>, js.lib.Float32Array>, value2:ts.AnyOf4<Float, Bool, Array<Float>, js.lib.Float32Array>):WebGLShader;
	/**
		Sets the given uniform value/s based on the name and GL function.
		
		This method is called internally by other methods such as `set1f` and `set3iv`.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function setUniform3(setter:haxe.Constraints.Function, name:String, value1:ts.AnyOf4<Float, Bool, Array<Float>, js.lib.Float32Array>, value2:ts.AnyOf4<Float, Bool, Array<Float>, js.lib.Float32Array>, value3:ts.AnyOf4<Float, Bool, Array<Float>, js.lib.Float32Array>):WebGLShader;
	/**
		Sets the given uniform value/s based on the name and GL function.
		
		This method is called internally by other methods such as `set1f` and `set3iv`.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function setUniform4(setter:haxe.Constraints.Function, name:String, value1:ts.AnyOf4<Float, Bool, Array<Float>, js.lib.Float32Array>, value2:ts.AnyOf4<Float, Bool, Array<Float>, js.lib.Float32Array>, value3:ts.AnyOf4<Float, Bool, Array<Float>, js.lib.Float32Array>, value4:ts.AnyOf4<Float, Bool, Array<Float>, js.lib.Float32Array>):WebGLShader;
	/**
		Sets a 1f uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set1f(name:String, x:Float):WebGLShader;
	/**
		Sets a 2f uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set2f(name:String, x:Float, y:Float):WebGLShader;
	/**
		Sets a 3f uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set3f(name:String, x:Float, y:Float, z:Float):WebGLShader;
	/**
		Sets a 4f uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set4f(name:String, x:Float, y:Float, z:Float, w:Float):WebGLShader;
	/**
		Sets a 1fv uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set1fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>):WebGLShader;
	/**
		Sets a 2fv uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set2fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>):WebGLShader;
	/**
		Sets a 3fv uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set3fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>):WebGLShader;
	/**
		Sets a 4fv uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set4fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>):WebGLShader;
	/**
		Sets a 1iv uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set1iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>):WebGLShader;
	/**
		Sets a 2iv uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set2iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>):WebGLShader;
	/**
		Sets a 3iv uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set3iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>):WebGLShader;
	/**
		Sets a 4iv uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set4iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>):WebGLShader;
	/**
		Sets a 1i uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set1i(name:String, x:Float):WebGLShader;
	/**
		Sets a 2i uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set2i(name:String, x:Float, y:Float):WebGLShader;
	/**
		Sets a 3i uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set3i(name:String, x:Float, y:Float, z:Float):WebGLShader;
	/**
		Sets a 4i uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function set4i(name:String, x:Float, y:Float, z:Float, w:Float):WebGLShader;
	/**
		Sets a matrix 2fv uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function setMatrix2fv(name:String, transpose:Bool, matrix:ts.AnyOf2<Array<Float>, js.lib.Float32Array>):WebGLShader;
	/**
		Sets a matrix 3fv uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function setMatrix3fv(name:String, transpose:Bool, matrix:js.lib.Float32Array):WebGLShader;
	/**
		Sets a matrix 4fv uniform value based on the given name on this shader.
		
		The uniform is only set if the value/s given are different to those previously set.
		
		This method works by first setting this shader as being the current shader within the
		WebGL Renderer, if it isn't already. It also sets this shader as being the current
		one within the pipeline it belongs to.
	**/
	function setMatrix4fv(name:String, transpose:Bool, matrix:js.lib.Float32Array):WebGLShader;
	/**
		Removes all external references from this class and deletes the WebGL program from the WebGL context.
		
		Does not remove this shader from the parent pipeline.
	**/
	function destroy():Void;
	static var prototype : WebGLShader;
}