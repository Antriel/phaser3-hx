package global.phaser.display.align;

@:native("Phaser.Display.Align.To") @valueModuleOnly extern class To {
	/**
		Takes given Game Object and aligns it so that it is positioned next to the bottom center position of the other.
	**/
	static function BottomCenter<G>(gameObject:G, alignTo:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned next to the bottom left position of the other.
	**/
	static function BottomLeft<G>(gameObject:G, alignTo:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned next to the bottom right position of the other.
	**/
	static function BottomRight<G>(gameObject:G, alignTo:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned next to the left bottom position of the other.
	**/
	static function LeftBottom<G>(gameObject:G, alignTo:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned next to the left center position of the other.
	**/
	static function LeftCenter<G>(gameObject:G, alignTo:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned next to the left top position of the other.
	**/
	static function LeftTop<G>(gameObject:G, alignTo:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes a Game Object and aligns it next to another, at the given position.
		The alignment used is based on the `position` argument, which is a `Phaser.Display.Align` property such as `LEFT_CENTER` or `TOP_RIGHT`.
	**/
	static function QuickSet<G>(child:G, alignTo:global.phaser.gameobjects.GameObject, position:Float, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned next to the right bottom position of the other.
	**/
	static function RightBottom<G>(gameObject:G, alignTo:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned next to the right center position of the other.
	**/
	static function RightCenter<G>(gameObject:G, alignTo:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned next to the right top position of the other.
	**/
	static function RightTop<G>(gameObject:G, alignTo:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned next to the top center position of the other.
	**/
	static function TopCenter<G>(gameObject:G, alignTo:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned next to the top left position of the other.
	**/
	static function TopLeft<G>(gameObject:G, alignTo:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned next to the top right position of the other.
	**/
	static function TopRight<G>(gameObject:G, alignTo:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
}