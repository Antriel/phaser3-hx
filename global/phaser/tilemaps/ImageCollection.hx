package global.phaser.tilemaps;

/**
	An Image Collection is a special Tile Set containing multiple images, with no slicing into each image.
	
	Image Collections are normally created automatically when Tiled data is loaded.
**/
@:native("Phaser.Tilemaps.ImageCollection") extern class ImageCollection {
	function new(name:String, firstgid:Float, ?width:Float, ?height:Float, ?margin:Float, ?spacing:Float, ?properties:Dynamic);
	/**
		The name of the Image Collection.
	**/
	var name : String;
	/**
		The Tiled firstgid value.
		This is the starting index of the first image index this Image Collection contains.
	**/
	var firstgid : Float;
	/**
		The width of the widest image (in pixels).
	**/
	final imageWidth : Float;
	/**
		The height of the tallest image (in pixels).
	**/
	final imageHeight : Float;
	/**
		The margin around the images in the collection (in pixels).
		Use `setSpacing` to change.
	**/
	final imageMarge : Float;
	/**
		The spacing between each image in the collection (in pixels).
		Use `setSpacing` to change.
	**/
	final imageSpacing : Float;
	/**
		Image Collection-specific properties that are typically defined in the Tiled editor.
	**/
	var properties : Dynamic;
	/**
		The cached images that are a part of this collection.
	**/
	final images : Array<Dynamic>;
	/**
		The total number of images in the image collection.
	**/
	final total : Float;
	/**
		Returns true if and only if this image collection contains the given image index.
	**/
	function containsImageIndex(imageIndex:Float):Bool;
	/**
		Add an image to this Image Collection.
	**/
	function addImage(gid:Float, image:String):ImageCollection;
	static var prototype : ImageCollection;
}