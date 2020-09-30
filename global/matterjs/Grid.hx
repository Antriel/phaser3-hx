package global.matterjs;

/**
	The `Matter.Grid` module contains methods for creating and manipulating collision broadphase grid structures.
**/
@:native("MatterJS.Grid") extern class Grid {
	function new();
	static var prototype : Grid;
	/**
		Creates a new grid.
	**/
	static function create(?options:IGridDefinition):Grid;
	/**
		Updates the grid.
	**/
	static function update(grid:Grid, bodies:Array<BodyType>, engine:Engine, forceUpdate:Bool):Void;
	/**
		Clears the grid.
	**/
	static function clear(grid:Grid):Void;
}