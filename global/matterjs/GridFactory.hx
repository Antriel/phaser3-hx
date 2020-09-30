package global.matterjs;

@:native("MatterJS.GridFactory") extern class GridFactory {
	function new();
	/**
		Creates a new grid.
	**/
	function create(?options:IGridDefinition):Grid;
	/**
		Updates the grid.
	**/
	function update(grid:Grid, bodies:Array<BodyType>, engine:Engine, forceUpdate:Bool):Void;
	/**
		Clears the grid.
	**/
	function clear(grid:Grid):Void;
	static var prototype : GridFactory;
}