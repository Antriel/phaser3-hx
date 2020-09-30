package global.matterjs;

/**
	The `Matter.Resolver` module contains methods for resolving collision pairs.
**/
@:native("MatterJS.Resolver") extern class Resolver {
	function new();
	static var prototype : Resolver;
	/**
		Prepare pairs for position solving.
	**/
	static function preSolvePosition(pairs:Array<IPair>):Void;
	/**
		Find a solution for pair positions.
	**/
	static function solvePosition(pairs:Array<IPair>, bodies:Array<BodyType>, timeScale:Float):Void;
	/**
		Apply position resolution.
	**/
	static function postSolvePosition(bodies:Array<BodyType>):Void;
	/**
		Prepare pairs for velocity solving.
	**/
	static function preSolveVelocity(pairs:Array<IPair>):Void;
	/**
		Find a solution for pair velocities.
	**/
	static function solveVelocity(pairs:Array<IPair>, timeScale:Float):Void;
}