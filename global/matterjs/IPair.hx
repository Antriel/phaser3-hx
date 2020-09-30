package global.matterjs;

typedef IPair = {
	var id : Float;
	var bodyA : Body;
	var bodyB : Body;
	var contacts : Dynamic;
	var activeContacts : Dynamic;
	var separation : Float;
	var isActive : Bool;
	var timeCreated : Float;
	var timeUpdated : Float;
	var inverseMass : Float;
	var friction : Float;
	var frictionStatic : Float;
	var restitution : Float;
	var slop : Float;
};