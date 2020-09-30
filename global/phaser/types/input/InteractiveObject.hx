package global.phaser.types.input;

typedef InteractiveObject = {
	/**
		The Game Object to which this Interactive Object is bound.
	**/
	var gameObject : global.phaser.gameobjects.GameObject;
	/**
		Is this Interactive Object currently enabled for input events?
	**/
	var enabled : Bool;
	/**
		An Interactive Object that is 'always enabled' will receive input even if the parent object is invisible or won't render.
	**/
	var alwaysEnabled : Bool;
	/**
		Is this Interactive Object draggable? Enable with `InputPlugin.setDraggable`.
	**/
	var draggable : Bool;
	/**
		Is this Interactive Object a drag-targets drop zone? Set when the object is created.
	**/
	var dropZone : Bool;
	/**
		Should this Interactive Object change the cursor (via css) when over? (desktop only)
	**/
	var cursor : ts.AnyOf2<String, Bool>;
	/**
		An optional drop target for a draggable Interactive Object.
	**/
	var target : global.phaser.gameobjects.GameObject;
	/**
		The most recent Camera to be tested against this Interactive Object.
	**/
	var camera : global.phaser.cameras.scene2d.Camera;
	/**
		The hit area for this Interactive Object. Typically a geometry shape, like a Rectangle or Circle.
	**/
	var hitArea : Dynamic;
	/**
		The 'contains' check callback that the hit area shape will use for all hit tests.
	**/
	dynamic function hitAreaCallback(hitArea:Dynamic, x:Float, y:Float, gameObject:global.phaser.gameobjects.GameObject):Void;
	/**
		If this Interactive Object has been enabled for debug, via `InputPlugin.enableDebug` then this property holds its debug shape.
	**/
	var hitAreaDebug : global.phaser.gameobjects.Shape;
	/**
		Was the hitArea for this Interactive Object created based on texture size (false), or a custom shape? (true)
	**/
	var customHitArea : Bool;
	/**
		The x coordinate that the Pointer interacted with this object on, relative to the Game Object's top-left position.
	**/
	var localX : Float;
	/**
		The y coordinate that the Pointer interacted with this object on, relative to the Game Object's top-left position.
	**/
	var localY : Float;
	/**
		The current drag state of this Interactive Object. 0 = Not being dragged, 1 = being checked for drag, or 2 = being actively dragged.
	**/
	var dragState : Int;
	/**
		The x coordinate of the Game Object that owns this Interactive Object when the drag started.
	**/
	var dragStartX : Float;
	/**
		The y coordinate of the Game Object that owns this Interactive Object when the drag started.
	**/
	var dragStartY : Float;
	/**
		The x coordinate that the Pointer started dragging this Interactive Object from.
	**/
	var dragStartXGlobal : Float;
	/**
		The y coordinate that the Pointer started dragging this Interactive Object from.
	**/
	var dragStartYGlobal : Float;
	/**
		The x coordinate that this Interactive Object is currently being dragged to.
	**/
	var dragX : Float;
	/**
		The y coordinate that this Interactive Object is currently being dragged to.
	**/
	var dragY : Float;
};