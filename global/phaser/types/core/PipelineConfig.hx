package global.phaser.types.core;

typedef PipelineConfig = {
	/**
		The name of the pipeline. Must be unique within the Pipeline Manager.
	**/
	var name : String;
	/**
		The pipeline class. This should be a constructable object, **not** an instance of a class.
	**/
	var pipeline : global.phaser.renderer.webgl.WebGLPipeline;
};