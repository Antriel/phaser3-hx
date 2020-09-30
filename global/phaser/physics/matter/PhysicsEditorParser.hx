package global.phaser.physics.matter;

/**
	Use PhysicsEditorParser.parseBody() to build a Matter body object, based on a physics data file
	created and exported with PhysicsEditor (https://www.codeandweb.com/physicseditor).
**/
@:native("Phaser.Physics.Matter.PhysicsEditorParser") @valueModuleOnly extern class PhysicsEditorParser {
	/**
		Parses a body element exported by PhysicsEditor.
	**/
	static function parseBody(x:Float, y:Float, config:Dynamic, ?options:global.phaser.types.physics.matter.MatterBodyConfig):global.matterjs.BodyType;
	/**
		Parses an element of the "fixtures" list exported by PhysicsEditor
	**/
	static function parseFixture(fixtureConfig:Dynamic):Array<global.matterjs.BodyType>;
	/**
		Parses the "vertices" lists exported by PhysicsEditor.
	**/
	static function parseVertices(vertexSets:Array<Dynamic>, ?options:global.phaser.types.physics.matter.MatterBodyConfig):Array<global.matterjs.BodyType>;
}