package global.matterjs;

typedef ICollisionData = {
	var collided : Bool;
	var bodyA : Body;
	var bodyB : Body;
	var axisBody : Body;
	var axisNumber : Float;
	var depth : Float;
	var parentA : Body;
	var parentB : Body;
	var normal : Vector;
	var tangent : Vector;
	var penetration : Vector;
	var supports : Array<Vector>;
	var inverseMass : Float;
	var friction : Float;
	var frictionStatic : Float;
	var restitution : Float;
	var slop : Float;
};