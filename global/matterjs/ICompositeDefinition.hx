package global.matterjs;

typedef ICompositeDefinition = {
	/**
		An array of `Body` that are _direct_ children of this composite.
		To add or remove bodies you should use `Composite.add` and `Composite.remove` methods rather than directly modifying this property.
		If you wish to recursively find all descendants, you should use the `Composite.allBodies` method.
	**/
	@:optional
	var bodies : Array<BodyType>;
	/**
		An array of `Composite` that are _direct_ children of this composite.
		To add or remove composites you should use `Composite.add` and `Composite.remove` methods rather than directly modifying this property.
		If you wish to recursively find all descendants, you should use the `Composite.allComposites` method.
	**/
	@:optional
	var composites : Array<CompositeType>;
	/**
		An array of `Constraint` that are _direct_ children of this composite.
		To add or remove constraints you should use `Composite.add` and `Composite.remove` methods rather than directly modifying this property.
		If you wish to recursively find all descendants, you should use the `Composite.allConstraints` method.
	**/
	@:optional
	var constraints : Array<ConstraintType>;
	/**
		An integer `Number` uniquely identifying number generated in `Composite.create` by `Common.nextId`.
	**/
	@:optional
	var id : Float;
	/**
		A flag that specifies whether the composite has been modified during the current step.
		Most `Matter.Composite` methods will automatically set this flag to `true` to inform the engine of changes to be handled.
		If you need to change it manually, you should use the `Composite.setModified` method.
	**/
	@:optional
	var isModified : Bool;
	/**
		An arbitrary `String` name to help the user identify and manage composites.
	**/
	@:optional
	var label : String;
	/**
		The `Composite` that is the parent of this composite. It is automatically managed by the `Matter.Composite` methods.
	**/
	@:optional
	var parent : CompositeType;
	/**
		A `String` denoting the type of object.
	**/
	@:optional
	var type : String;
};