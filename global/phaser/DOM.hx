package global.phaser;

@:native("Phaser.DOM") @valueModuleOnly extern class DOM {
	/**
		Adds the given element to the DOM. If a parent is provided the element is added as a child of the parent, providing it was able to access it.
		If no parent was given it falls back to using `document.body`.
	**/
	static function AddToDOM(element:js.html.Element, ?parent:ts.AnyOf2<String, js.html.Element>):js.html.Element;
	/**
		Inspects the readyState of the document. If the document is already complete then it invokes the given callback.
		If not complete it sets up several event listeners such as `deviceready`, and once those fire, it invokes the callback.
		Called automatically by the Phaser.Game instance. Should not usually be accessed directly.
	**/
	static function DOMContentLoaded(callback:global.ContentLoadedCallback):Void;
	/**
		Attempts to determine the document inner height across iOS and standard devices.
		Based on code by @tylerjpeterson
	**/
	static function GetInnerHeight(iOS:Bool):Float;
	/**
		Attempts to determine the screen orientation using the Orientation API.
	**/
	static function GetScreenOrientation(width:Float, height:Float):String;
	/**
		Attempts to get the target DOM element based on the given value, which can be either
		a string, in which case it will be looked-up by ID, or an element node. If nothing
		can be found it will return a reference to the document.body.
	**/
	static function GetTarget(element:js.html.Element):Void;
	/**
		Takes the given data string and parses it as XML.
		First tries to use the window.DOMParser and reverts to the Microsoft.XMLDOM if that fails.
		The parsed XML object is returned, or `null` if there was an error while parsing the data.
	**/
	static function ParseXML(data:String):ts.AnyOf2<js.lib.ActiveXObject, js.html.DOMParser>;
	/**
		Attempts to remove the element from its parentNode in the DOM.
	**/
	static function RemoveFromDOM(element:js.html.Element):Void;
}