package global.phaser.types.actions;

typedef GridAlignConfig = {
	/**
		The width of the grid in items (not pixels). -1 means lay all items out horizontally, regardless of quantity.
		                                  If both this value and height are set to -1 then this value overrides it and the `height` value is ignored.
	**/
	@:optional
	var width : Float;
	/**
		The height of the grid in items (not pixels). -1 means lay all items out vertically, regardless of quantity.
		                                   If both this value and `width` are set to -1 then `width` overrides it and this value is ignored.
	**/
	@:optional
	var height : Float;
	/**
		The width of the cell, in pixels, in which the item is positioned.
	**/
	@:optional
	var cellWidth : Float;
	/**
		The height of the cell, in pixels, in which the item is positioned.
	**/
	@:optional
	var cellHeight : Float;
	/**
		The alignment position. One of the Phaser.Display.Align consts such as `TOP_LEFT` or `RIGHT_CENTER`.
	**/
	@:optional
	var position : Float;
	/**
		Optionally place the top-left of the final grid at this coordinate.
	**/
	@:optional
	var x : Float;
	/**
		Optionally place the top-left of the final grid at this coordinate.
	**/
	@:optional
	var y : Float;
};