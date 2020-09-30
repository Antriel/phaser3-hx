package global.phaser.types.physics.matter;

typedef MatterCollisionPair = {
	/**
		The unique auto-generated collision pair id. A combination of the body A and B IDs.
	**/
	var id : String;
	/**
		A reference to the first body involved in the collision.
	**/
	var bodyA : global.matterjs.BodyType;
	/**
		A reference to the second body involved in the collision.
	**/
	var bodyB : global.matterjs.BodyType;
	/**
		An array containing all of the active contacts between bodies A and B.
	**/
	var activeContacts : Array<global.matterjs.Vector>;
	/**
		The amount of separation that occured between bodies A and B.
	**/
	var separation : Float;
	/**
		Is the collision still active or not?
	**/
	var isActive : Bool;
	/**
		Has Matter determined the collision are being active yet?
	**/
	var confirmedActive : Bool;
	/**
		Is either body A or B a sensor?
	**/
	var isSensor : Bool;
	/**
		The timestamp when the collision pair was created.
	**/
	var timeCreated : Float;
	/**
		The timestamp when the collision pair was most recently updated.
	**/
	var timeUpdated : Float;
	/**
		The collision data object.
	**/
	var collision : MatterCollisionData;
	/**
		The resulting inverse mass from the collision.
	**/
	var inverseMass : Float;
	/**
		The resulting friction from the collision.
	**/
	var friction : Float;
	/**
		The resulting static friction from the collision.
	**/
	var frictionStatic : Float;
	/**
		The resulting restitution from the collision.
	**/
	var restitution : Float;
	/**
		The resulting slop from the collision.
	**/
	var slop : Float;
};