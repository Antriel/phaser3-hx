package global.matterjs;

@:native("MatterJS.DetectorFactory") extern class DetectorFactory {
	function new();
	/**
		Finds all collisions given a list of pairs.
	**/
	function collisions(broadphasePairs:Array<IPair>, engine:Engine):Array<ICollisionData>;
	/**
		Returns `true` if both supplied collision filters will allow a collision to occur.
		See `body.collisionFilter` for more information.
	**/
	function canCollide(filterA:ICollisionFilter, filterB:ICollisionFilter):Bool;
	static var prototype : DetectorFactory;
}