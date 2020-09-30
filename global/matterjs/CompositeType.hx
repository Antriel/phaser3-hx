package global.matterjs;

typedef CompositeType = {
	/**
		An integer `Number` uniquely identifying number generated in `Composite.create` by `Common.nextId`.
	**/
	var id : Float;
	/**
		A `String` denoting the type of object.
	**/
	var type : String;
	/**
		The `Composite` that is the parent of this composite. It is automatically managed by the `Matter.Composite` methods.
	**/
	@:optional
	var parent : CompositeType;
	/**
		A flag that specifies whether the composite has been modified during the current step.
		Most `Matter.Composite` methods will automatically set this flag to `true` to inform the engine of changes to be handled.
		If you need to change it manually, you should use the `Composite.setModified` method.
	**/
	var isModified : Bool;
	/**
		An array of `Body` that are _direct_ children of this composite.
		To add or remove bodies you should use `Composite.add` and `Composite.remove` methods rather than directly modifying this property.
		If you wish to recursively find all descendants, you should use the `Composite.allBodies` method.
	**/
	var bodies : Array<BodyType>;
	/**
		An array of `Constraint` that are _direct_ children of this composite.
		To add or remove constraints you should use `Composite.add` and `Composite.remove` methods rather than directly modifying this property.
		If you wish to recursively find all descendants, you should use the `Composite.allConstraints` method.
	**/
	var constraints : Array<ConstraintType>;
	/**
		An array of `Composite` that are _direct_ children of this composite.
		To add or remove composites you should use `Composite.add` and `Composite.remove` methods rather than directly modifying this property.
		If you wish to recursively find all descendants, you should use the `Composite.allComposites` method.
	**/
	var composites : Array<CompositeType>;
	/**
		An arbitrary `String` name to help the user identify and manage composites.
	**/
	var label : String;
	/**
		An object reserved for storing plugin-specific properties.
	**/
	var plugin : Dynamic;
};