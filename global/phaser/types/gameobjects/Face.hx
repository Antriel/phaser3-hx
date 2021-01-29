package global.phaser.types.gameobjects;

typedef Face = {
	/**
		The first face vertex.
	**/
	var vertex1 : Vertex;
	/**
		The second face vertex.
	**/
	var vertex2 : Vertex;
	/**
		The third face vertex.
	**/
	var vertex3 : Vertex;
	/**
		Are the vertices counter-clockwise?
	**/
	var isCounterClockwise : Bool;
};