package global.matterjs;

/**
	The `Matter.Sleeping` module contains methods to manage the sleeping state of bodies.
**/
@:native("MatterJS.Sleeping") extern class Sleeping {
	function new();
	static var prototype : Sleeping;
	static function set(body:BodyType, isSleeping:Bool):Void;
}