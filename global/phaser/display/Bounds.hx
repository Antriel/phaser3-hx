package global.phaser.display;

@:native("Phaser.Display.Bounds") @valueModuleOnly extern class Bounds {
	/**
		Positions the Game Object so that it is centered on the given coordinates.
	**/
	static function CenterOn<G>(gameObject:G, x:Float, y:Float):G;
	/**
		Returns the bottom coordinate from the bounds of the Game Object.
	**/
	static function GetBottom(gameObject:global.phaser.gameobjects.GameObject):Float;
	/**
		Returns the unrotated bounds of the Game Object as a rectangle.
	**/
	static function GetBounds(gameObject:global.phaser.gameobjects.GameObject, ?output:ts.AnyOf2<Dynamic, global.phaser.geom.Rectangle>):ts.AnyOf2<Dynamic, global.phaser.geom.Rectangle>;
	/**
		Returns the center x coordinate from the bounds of the Game Object.
	**/
	static function GetCenterX(gameObject:global.phaser.gameobjects.GameObject):Float;
	/**
		Returns the center y coordinate from the bounds of the Game Object.
	**/
	static function GetCenterY(gameObject:global.phaser.gameobjects.GameObject):Float;
	/**
		Returns the left coordinate from the bounds of the Game Object.
	**/
	static function GetLeft(gameObject:global.phaser.gameobjects.GameObject):Float;
	/**
		Returns the amount the Game Object is visually offset from its x coordinate.
		This is the same as `width * origin.x`.
		This value will only be > 0 if `origin.x` is not equal to zero.
	**/
	static function GetOffsetX(gameObject:global.phaser.gameobjects.GameObject):Float;
	/**
		Returns the amount the Game Object is visually offset from its y coordinate.
		This is the same as `width * origin.y`.
		This value will only be > 0 if `origin.y` is not equal to zero.
	**/
	static function GetOffsetY(gameObject:global.phaser.gameobjects.GameObject):Float;
	/**
		Returns the right coordinate from the bounds of the Game Object.
	**/
	static function GetRight(gameObject:global.phaser.gameobjects.GameObject):Float;
	/**
		Returns the top coordinate from the bounds of the Game Object.
	**/
	static function GetTop(gameObject:global.phaser.gameobjects.GameObject):Float;
	/**
		Positions the Game Object so that the bottom of its bounds aligns with the given coordinate.
	**/
	static function SetBottom<G>(gameObject:G, value:Float):G;
	/**
		Positions the Game Object so that the center top of its bounds aligns with the given coordinate.
	**/
	static function SetCenterX<G>(gameObject:G, x:Float):G;
	/**
		Positions the Game Object so that the center top of its bounds aligns with the given coordinate.
	**/
	static function SetCenterY<G>(gameObject:G, y:Float):G;
	/**
		Positions the Game Object so that the left of its bounds aligns with the given coordinate.
	**/
	static function SetLeft<G>(gameObject:G, value:Float):G;
	/**
		Positions the Game Object so that the left of its bounds aligns with the given coordinate.
	**/
	static function SetRight<G>(gameObject:G, value:Float):G;
	/**
		Positions the Game Object so that the top of its bounds aligns with the given coordinate.
	**/
	static function SetTop<G>(gameObject:G, value:Float):G;
}