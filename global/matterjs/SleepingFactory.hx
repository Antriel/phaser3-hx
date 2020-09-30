package global.matterjs;

@:native("MatterJS.SleepingFactory") extern class SleepingFactory {
	function new();
	function set(body:BodyType, isSleeping:Bool):Void;
	static var prototype : SleepingFactory;
}