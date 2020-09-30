package global.phaser.display.align;

@:native("Phaser.Display.Align.In") @valueModuleOnly extern class In {
	/**
		Takes given Game Object and aligns it so that it is positioned in the bottom center of the other.
	**/
	static function BottomCenter<G>(gameObject:G, alignIn:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned in the bottom left of the other.
	**/
	static function BottomLeft<G>(gameObject:G, alignIn:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned in the bottom right of the other.
	**/
	static function BottomRight<G>(gameObject:G, alignIn:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned in the center of the other.
	**/
	static function Center<G>(gameObject:G, alignIn:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned in the left center of the other.
	**/
	static function LeftCenter<G>(gameObject:G, alignIn:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned relative to the other.
		The alignment used is based on the `position` argument, which is an `ALIGN_CONST` value, such as `LEFT_CENTER` or `TOP_RIGHT`.
	**/
	static function QuickSet<G>(child:G, alignIn:global.phaser.gameobjects.GameObject, position:Float, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned in the right center of the other.
	**/
	static function RightCenter<G>(gameObject:G, alignIn:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned in the top center of the other.
	**/
	static function TopCenter<G>(gameObject:G, alignIn:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned in the top left of the other.
	**/
	static function TopLeft<G>(gameObject:G, alignIn:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes given Game Object and aligns it so that it is positioned in the top right of the other.
	**/
	static function TopRight<G>(gameObject:G, alignIn:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float):G;
}