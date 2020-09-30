package global.phaser.structs;

/**
	The Size component allows you to set `width` and `height` properties and define the relationship between them.
	
	The component can automatically maintain the aspect ratios between the two values, and clamp them
	to a defined min-max range. You can also control the dominant axis. When dimensions are given to the Size component
	that would cause it to exceed its min-max range, the dimensions are adjusted based on the dominant axis.
**/
@:native("Phaser.Structs.Size") extern class Size {
	function new(?width:Float, ?height:Float, ?aspectMode:Float, ?parent:Dynamic);
	/**
		The aspect mode this Size component will use when calculating its dimensions.
		This property is read-only. To change it use the `setAspectMode` method.
	**/
	final aspectMode : Float;
	/**
		The proportional relationship between the width and height.
		
		This property is read-only and is updated automatically when either the `width` or `height` properties are changed,
		depending on the aspect mode.
	**/
	final aspectRatio : Float;
	/**
		The minimum allowed width.
		Cannot be less than zero.
		This value is read-only. To change it see the `setMin` method.
	**/
	final minWidth : Float;
	/**
		The minimum allowed height.
		Cannot be less than zero.
		This value is read-only. To change it see the `setMin` method.
	**/
	final minHeight : Float;
	/**
		The maximum allowed width.
		This value is read-only. To change it see the `setMax` method.
	**/
	final maxWidth : Float;
	/**
		The maximum allowed height.
		This value is read-only. To change it see the `setMax` method.
	**/
	final maxHeight : Float;
	/**
		A Vector2 containing the horizontal and vertical snap values, which the width and height are snapped to during resizing.
		
		By default this is disabled.
		
		This property is read-only. To change it see the `setSnap` method.
	**/
	final snapTo : global.phaser.math.Vector2;
	/**
		Sets the aspect mode of this Size component.
		
		The aspect mode controls what happens when you modify the `width` or `height` properties, or call `setSize`.
		
		It can be a number from 0 to 4, or a Size constant:
		
		0. NONE = Do not make the size fit the aspect ratio. Change the ratio when the size changes.
		1. WIDTH_CONTROLS_HEIGHT = The height is automatically adjusted based on the width.
		2. HEIGHT_CONTROLS_WIDTH = The width is automatically adjusted based on the height.
		3. FIT = The width and height are automatically adjusted to fit inside the given target area, while keeping the aspect ratio. Depending on the aspect ratio there may be some space inside the area which is not covered.
		4. ENVELOP = The width and height are automatically adjusted to make the size cover the entire target area while keeping the aspect ratio. This may extend further out than the target size.
		
		Calling this method automatically recalculates the `width` and the `height`, if required.
	**/
	function setAspectMode(?value:Float):Size;
	/**
		By setting a Snap To value when this Size component is modified its dimensions will automatically
		by snapped to the nearest grid slice, using floor. For example, if you have snap value of 16,
		and the width changes to 68, then it will snap down to 64 (the closest multiple of 16 when floored)
		
		Note that snapping takes place before adjustments by the parent, or the min / max settings. If these
		values are not multiples of the given snap values, then this can result in un-snapped dimensions.
		
		Call this method with no arguments to reset the snap values.
		
		Calling this method automatically recalculates the `width` and the `height`, if required.
	**/
	function setSnap(?snapWidth:Float, ?snapHeight:Float):Size;
	/**
		Sets, or clears, the parent of this Size component.
		
		To clear the parent call this method with no arguments.
		
		The parent influences the maximum extents to which this Size component can expand,
		based on the aspect mode:
		
		NONE - The parent clamps both the width and height.
		WIDTH_CONTROLS_HEIGHT - The parent clamps just the width.
		HEIGHT_CONTROLS_WIDTH - The parent clamps just the height.
		FIT - The parent clamps whichever axis is required to ensure the size fits within it.
		ENVELOP - The parent is used to ensure the size fully envelops the parent.
		
		Calling this method automatically calls `setSize`.
	**/
	function setParent(?parent:Dynamic):Size;
	/**
		Set the minimum width and height values this Size component will allow.
		
		The minimum values can never be below zero, or greater than the maximum values.
		
		Setting this will automatically adjust both the `width` and `height` properties to ensure they are within range.
		
		Note that based on the aspect mode, and if this Size component has a parent set or not, the minimums set here
		_can_ be exceed in some situations.
	**/
	function setMin(?width:Float, ?height:Float):Size;
	/**
		Set the maximum width and height values this Size component will allow.
		
		Setting this will automatically adjust both the `width` and `height` properties to ensure they are within range.
		
		Note that based on the aspect mode, and if this Size component has a parent set or not, the maximums set here
		_can_ be exceed in some situations.
	**/
	function setMax(?width:Float, ?height:Float):Size;
	/**
		Sets the width and height of this Size component based on the aspect mode.
		
		If the aspect mode is 'none' then calling this method will change the aspect ratio, otherwise the current
		aspect ratio is honored across all other modes.
		
		If snapTo values have been set then the given width and height are snapped first, prior to any further
		adjustment via min/max values, or a parent.
		
		If minimum and/or maximum dimensions have been specified, the values given to this method will be clamped into
		that range prior to adjustment, but may still exceed them depending on the aspect mode.
		
		If this Size component has a parent set, and the aspect mode is `fit` or `envelop`, then the given sizes will
		be clamped to the range specified by the parent.
	**/
	function setSize(?width:Float, ?height:Float):Size;
	/**
		Sets a new aspect ratio, overriding what was there previously.
		
		It then calls `setSize` immediately using the current dimensions.
	**/
	function setAspectRatio(ratio:Float):Size;
	/**
		Sets a new width and height for this Size component and updates the aspect ratio based on them.
		
		It _doesn't_ change the `aspectMode` and still factors in size limits such as the min max and parent bounds.
	**/
	function resize(width:Float, ?height:Float):Size;
	/**
		Takes a new width and passes it through the min/max clamp and then checks it doesn't exceed the parent width.
	**/
	function getNewWidth(value:Float, ?checkParent:Bool):Float;
	/**
		Takes a new height and passes it through the min/max clamp and then checks it doesn't exceed the parent height.
	**/
	function getNewHeight(value:Float, ?checkParent:Bool):Float;
	/**
		The current `width` and `height` are adjusted to fit inside the given dimensions, while keeping the aspect ratio.
		
		If `fit` is true there may be some space inside the target area which is not covered if its aspect ratio differs.
		If `fit` is false the size may extend further out than the target area if the aspect ratios differ.
		
		If this Size component has a parent set, then the width and height passed to this method will be clamped so
		it cannot exceed that of the parent.
	**/
	function constrain(?width:Float, ?height:Float, ?fit:Bool):Size;
	/**
		The current `width` and `height` are adjusted to fit inside the given dimensions, while keeping the aspect ratio.
		
		There may be some space inside the target area which is not covered if its aspect ratio differs.
		
		If this Size component has a parent set, then the width and height passed to this method will be clamped so
		it cannot exceed that of the parent.
	**/
	function fitTo(?width:Float, ?height:Float):Size;
	/**
		The current `width` and `height` are adjusted so that they fully envelope the given dimensions, while keeping the aspect ratio.
		
		The size may extend further out than the target area if the aspect ratios differ.
		
		If this Size component has a parent set, then the values are clamped so that it never exceeds the parent
		on the longest axis.
	**/
	function envelop(?width:Float, ?height:Float):Size;
	/**
		Sets the width of this Size component.
		
		Depending on the aspect mode, changing the width may also update the height and aspect ratio.
	**/
	function setWidth(width:Float):Size;
	/**
		Sets the height of this Size component.
		
		Depending on the aspect mode, changing the height may also update the width and aspect ratio.
	**/
	function setHeight(height:Float):Size;
	/**
		Returns a string representation of this Size component.
	**/
	function toString():String;
	/**
		Sets the values of this Size component to the `element.style.width` and `height`
		properties of the given DOM Element. The properties are set as `px` values.
	**/
	function setCSS(element:js.html.Element):Void;
	/**
		Copies the aspect mode, aspect ratio, width and height from this Size component
		to the given Size component. Note that the parent, if set, is not copied across.
	**/
	function copy(destination:Size):Size;
	/**
		Destroys this Size component.
		
		This clears the local properties and any parent object, if set.
		
		A destroyed Size component cannot be re-used.
	**/
	function destroy():Void;
	/**
		The width of this Size component.
		
		This value is clamped to the range specified by `minWidth` and `maxWidth`, if enabled.
		
		A width can never be less than zero.
		
		Changing this value will automatically update the `height` if the aspect ratio lock is enabled.
		You can also use the `setWidth` and `getWidth` methods.
	**/
	var width : Float;
	/**
		The height of this Size component.
		
		This value is clamped to the range specified by `minHeight` and `maxHeight`, if enabled.
		
		A height can never be less than zero.
		
		Changing this value will automatically update the `width` if the aspect ratio lock is enabled.
		You can also use the `setHeight` and `getHeight` methods.
	**/
	var height : Float;
	static var prototype : Size;
	/**
		Do not make the size fit the aspect ratio. Change the ratio when the size changes.
	**/
	static final NONE : Float;
	/**
		The height is automatically adjusted based on the width.
	**/
	static final WIDTH_CONTROLS_HEIGHT : Float;
	/**
		The width is automatically adjusted based on the height.
	**/
	static final HEIGHT_CONTROLS_WIDTH : Float;
	/**
		The width and height are automatically adjusted to fit inside the given target area, while keeping the aspect ratio. Depending on the aspect ratio there may be some space inside the area which is not covered.
	**/
	static final FIT : Float;
	/**
		The width and height are automatically adjusted to make the size cover the entire target area while keeping the aspect ratio. This may extend further out than the target size.
	**/
	static final ENVELOP : Float;
}