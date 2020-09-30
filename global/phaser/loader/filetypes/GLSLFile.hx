package global.phaser.loader.filetypes;

/**
	A single GLSL File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#glsl method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#glsl.
**/
@:native("Phaser.Loader.FileTypes.GLSLFile") extern class GLSLFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.GLSLFileConfig>, ?url:String, ?shaderType:String, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject);
	/**
		Returns the name of the shader from the header block.
	**/
	function getShaderName(headerSource:Array<String>):String;
	/**
		Returns the type of the shader from the header block.
	**/
	function getShaderType(headerSource:Array<String>):String;
	/**
		Returns the shader uniforms from the header block.
	**/
	function getShaderUniforms(headerSource:Array<String>):Dynamic;
	static var prototype : GLSLFile;
}