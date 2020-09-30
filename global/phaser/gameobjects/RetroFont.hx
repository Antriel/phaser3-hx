package global.phaser.gameobjects;

@:native("Phaser.GameObjects.RetroFont") @valueModuleOnly extern class RetroFont {
	/**
		Parses a Retro Font configuration object so you can pass it to the BitmapText constructor
		and create a BitmapText object using a fixed-width retro font.
	**/
	static function Parse(scene:global.phaser.Scene, config:global.phaser.types.gameobjects.bitmaptext.RetroFontConfig):Dynamic;
	/**
		Text Set 1 =  !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~
	**/
	static var TEXT_SET1 : String;
	/**
		Text Set 2 =  !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ
	**/
	static var TEXT_SET2 : String;
	/**
		Text Set 3 = ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
	**/
	static var TEXT_SET3 : String;
	/**
		Text Set 4 = ABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789
	**/
	static var TEXT_SET4 : String;
	/**
		Text Set 5 = ABCDEFGHIJKLMNOPQRSTUVWXYZ.,/() '!?-*:0123456789
	**/
	static var TEXT_SET5 : String;
	/**
		Text Set 6 = ABCDEFGHIJKLMNOPQRSTUVWXYZ!?:;0123456789"(),-.'
	**/
	static var TEXT_SET6 : String;
	/**
		Text Set 7 = AGMSY+:4BHNTZ!;5CIOU.?06DJPV,(17EKQW")28FLRX-'39
	**/
	static var TEXT_SET7 : String;
	/**
		Text Set 8 = 0123456789 .ABCDEFGHIJKLMNOPQRSTUVWXYZ
	**/
	static var TEXT_SET8 : String;
	/**
		Text Set 9 = ABCDEFGHIJKLMNOPQRSTUVWXYZ()-0123456789.:,'"?!
	**/
	static var TEXT_SET9 : String;
	/**
		Text Set 10 = ABCDEFGHIJKLMNOPQRSTUVWXYZ
	**/
	static var TEXT_SET10 : String;
	/**
		Text Set 11 = ABCDEFGHIJKLMNOPQRSTUVWXYZ.,"-+!?()':;0123456789
	**/
	static var TEXT_SET11 : String;
}