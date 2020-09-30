package global.matterjs;

typedef ICollisionPair = {
	var id : String;
	var bodyA : Body;
	var bodyB : Body;
	var activeContacts : Array<Vector>;
	var separation : Float;
	var isActive : Bool;
	var confirmedActive : Bool;
	var isSensor : Bool;
	var timeCreated : Float;
	var timeUpdated : Float;
	var collision : ICollisionData;
	var inverseMass : Float;
	var friction : Float;
	var frictionStatic : Float;
	var restitution : Float;
	var slop : Float;
};