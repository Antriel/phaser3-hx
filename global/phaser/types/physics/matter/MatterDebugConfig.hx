package global.phaser.types.physics.matter;

typedef MatterDebugConfig = {
	/**
		Render all of the body axes?
	**/
	@:optional
	var showAxes : Bool;
	/**
		Render just a single body axis?
	**/
	@:optional
	var showAngleIndicator : Bool;
	/**
		The color of the body angle / axes lines.
	**/
	@:optional
	var angleColor : Float;
	/**
		Render the broadphase grid?
	**/
	@:optional
	var showBroadphase : Bool;
	/**
		The color of the broadphase grid.
	**/
	@:optional
	var broadphaseColor : Float;
	/**
		Render the bounds of the bodies in the world?
	**/
	@:optional
	var showBounds : Bool;
	/**
		The color of the body bounds.
	**/
	@:optional
	var boundsColor : Float;
	/**
		Render the velocity of the bodies in the world?
	**/
	@:optional
	var showVelocity : Bool;
	/**
		The color of the body velocity line.
	**/
	@:optional
	var velocityColor : Float;
	/**
		Render the collision points and normals for colliding pairs.
	**/
	@:optional
	var showCollisions : Bool;
	/**
		The color of the collision points.
	**/
	@:optional
	var collisionColor : Float;
	/**
		Render lines showing the separation between bodies.
	**/
	@:optional
	var showSeparation : Bool;
	/**
		The color of the body separation line.
	**/
	@:optional
	var separationColor : Float;
	/**
		Render the dynamic bodies in the world to the Graphics object?
	**/
	@:optional
	var showBody : Bool;
	/**
		Render the static bodies in the world to the Graphics object?
	**/
	@:optional
	var showStaticBody : Bool;
	/**
		When rendering bodies, render the internal edges as well?
	**/
	@:optional
	var showInternalEdges : Bool;
	/**
		Render the bodies using a fill color.
	**/
	@:optional
	var renderFill : Bool;
	/**
		Render the bodies using a line stroke.
	**/
	@:optional
	var renderLine : Bool;
	/**
		The color value of the fill when rendering dynamic bodies.
	**/
	@:optional
	var fillColor : Float;
	/**
		The opacity of the fill when rendering dynamic bodies, a value between 0 and 1.
	**/
	@:optional
	var fillOpacity : Float;
	/**
		The color value of the line stroke when rendering dynamic bodies.
	**/
	@:optional
	var lineColor : Float;
	/**
		The opacity of the line when rendering dynamic bodies, a value between 0 and 1.
	**/
	@:optional
	var lineOpacity : Float;
	/**
		If rendering lines, the thickness of the line.
	**/
	@:optional
	var lineThickness : Float;
	/**
		The color value of the fill when rendering static bodies.
	**/
	@:optional
	var staticFillColor : Float;
	/**
		The color value of the line stroke when rendering static bodies.
	**/
	@:optional
	var staticLineColor : Float;
	/**
		Render any sleeping bodies (dynamic or static) in the world to the Graphics object?
	**/
	@:optional
	var showSleeping : Bool;
	/**
		The amount to multiply the opacity of sleeping static bodies by.
	**/
	@:optional
	var staticBodySleepOpacity : Float;
	/**
		The color value of the fill when rendering sleeping dynamic bodies.
	**/
	@:optional
	var sleepFillColor : Float;
	/**
		The color value of the line stroke when rendering sleeping dynamic bodies.
	**/
	@:optional
	var sleepLineColor : Float;
	/**
		Render bodies or body parts that are flagged as being a sensor?
	**/
	@:optional
	var showSensors : Bool;
	/**
		The fill color when rendering body sensors.
	**/
	@:optional
	var sensorFillColor : Float;
	/**
		The line color when rendering body sensors.
	**/
	@:optional
	var sensorLineColor : Float;
	/**
		Render the position of non-static bodies?
	**/
	@:optional
	var showPositions : Bool;
	/**
		The size of the rectangle drawn when rendering the body position.
	**/
	@:optional
	var positionSize : Float;
	/**
		The color value of the rectangle drawn when rendering the body position.
	**/
	@:optional
	var positionColor : Float;
	/**
		Render all world constraints to the Graphics object?
	**/
	@:optional
	var showJoint : Bool;
	/**
		The color value of joints when `showJoint` is set.
	**/
	@:optional
	var jointColor : Float;
	/**
		The line opacity when rendering joints, a value between 0 and 1.
	**/
	@:optional
	var jointLineOpacity : Float;
	/**
		The line thickness when rendering joints.
	**/
	@:optional
	var jointLineThickness : Float;
	/**
		The size of the circles drawn when rendering pin constraints.
	**/
	@:optional
	var pinSize : Float;
	/**
		The color value of the circles drawn when rendering pin constraints.
	**/
	@:optional
	var pinColor : Float;
	/**
		The color value of spring constraints.
	**/
	@:optional
	var springColor : Float;
	/**
		The color value of constraint anchors.
	**/
	@:optional
	var anchorColor : Float;
	/**
		The size of the circles drawn as the constraint anchors.
	**/
	@:optional
	var anchorSize : Float;
	/**
		When rendering polygon bodies, render the convex hull as well?
	**/
	@:optional
	var showConvexHulls : Bool;
	/**
		The color value of hulls when `showConvexHulls` is set.
	**/
	@:optional
	var hullColor : Float;
};