package global.matterjs;

@:native("MatterJS.ResolverFactory") extern class ResolverFactory {
	function new();
	/**
		Prepare pairs for position solving.
	**/
	function preSolvePosition(pairs:Array<IPair>):Void;
	/**
		Find a solution for pair positions.
	**/
	function solvePosition(pairs:Array<IPair>, bodies:Array<BodyType>, timeScale:Float):Void;
	/**
		Apply position resolution.
	**/
	function postSolvePosition(bodies:Array<BodyType>):Void;
	/**
		Prepare pairs for velocity solving.
	**/
	function preSolveVelocity(pairs:Array<IPair>):Void;
	/**
		Find a solution for pair velocities.
	**/
	function solveVelocity(pairs:Array<IPair>, timeScale:Float):Void;
	static var prototype : ResolverFactory;
}