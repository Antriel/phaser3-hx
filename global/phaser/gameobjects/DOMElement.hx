package global.phaser.gameobjects;

/**
	DOM Element Game Objects are a way to control and manipulate HTML Elements over the top of your game.
	
	In order for DOM Elements to display you have to enable them by adding the following to your game
	configuration object:
	
	```javascript
	dom {
	   createContainer: true
	}
	```
	
	When this is added, Phaser will automatically create a DOM Container div that is positioned over the top
	of the game canvas. This div is sized to match the canvas, and if the canvas size changes, as a result of
	settings within the Scale Manager, the dom container is resized accordingly.
	
	If you have not already done so, you have to provide a `parent` in the Game Configuration, or the DOM
	Container will fail to be created.
	
	You can create a DOM Element by either passing in DOMStrings, or by passing in a reference to an existing
	Element that you wish to be placed under the control of Phaser. For example:
	
	```javascript
	this.add.dom(x, y, 'div', 'background-color: lime; width: 220px; height: 100px; font: 48px Arial', 'Phaser');
	```
	
	The above code will insert a div element into the DOM Container at the given x/y coordinate. The DOMString in
	the 4th argument sets the initial CSS style of the div and the final argument is the inner text. In this case,
	it will create a lime colored div that is 220px by 100px in size with the text Phaser in it, in an Arial font.
	
	You should nearly always, without exception, use explicitly sized HTML Elements, in order to fully control
	alignment and positioning of the elements next to regular game content.
	
	Rather than specify the CSS and HTML directly you can use the `load.html` File Loader to load it into the
	cache and then use the `createFromCache` method instead. You can also use `createFromHTML` and various other
	methods available in this class to help construct your elements.
	
	Once the element has been created you can then control it like you would any other Game Object. You can set its
	position, scale, rotation, alpha and other properties. It will move as the main Scene Camera moves and be clipped
	at the edge of the canvas. It's important to remember some limitations of DOM Elements: The obvious one is that
	they appear above or below your game canvas. You cannot blend them into the display list, meaning you cannot have
	a DOM Element, then a Sprite, then another DOM Element behind it.
	
	They also cannot be enabled for input. To do that, you have to use the `addListener` method to add native event
	listeners directly. The final limitation is to do with cameras. The DOM Container is sized to match the game canvas
	entirely and clipped accordingly. DOM Elements respect camera scrolling and scrollFactor settings, but if you
	change the size of the camera so it no longer matches the size of the canvas, they won't be clipped accordingly.
	
	Also, all DOM Elements are inserted into the same DOM Container, regardless of which Scene they are created in.
	
	Note that you should only have DOM Elements in a Scene with a _single_ Camera. If you require multiple cameras,
	use parallel scenes to achieve this.
	
	DOM Elements are a powerful way to align native HTML with your Phaser Game Objects. For example, you can insert
	a login form for a multiplayer game directly into your title screen. Or a text input box for a highscore table.
	Or a banner ad from a 3rd party service. Or perhaps you'd like to use them for high resolution text display and
	UI. The choice is up to you, just remember that you're dealing with standard HTML and CSS floating over the top
	of your game, and should treat it accordingly.
**/
@:native("Phaser.GameObjects.DOMElement") extern class DOMElement extends GameObject {
	function new(scene:global.phaser.Scene, ?x:Float, ?y:Float, ?element:ts.AnyOf2<String, js.html.DOMElement>, ?style:Dynamic, ?innerText:String);
	/**
		A reference to the parent DOM Container that the Game instance created when it started.
	**/
	var parent : js.html.DOMElement;
	/**
		A reference to the HTML Cache.
	**/
	var cache : global.phaser.cache.BaseCache;
	/**
		The actual DOM Element that this Game Object is bound to. For example, if you've created a `<div>`
		then this property is a direct reference to that element within the dom.
	**/
	var node : js.html.DOMElement;
	/**
		By default a DOM Element will have its transform, display, opacity, zIndex and blend mode properties
		updated when its rendered. If, for some reason, you don't want any of these changed other than the
		CSS transform, then set this flag to `true`. When `true` only the CSS Transform is applied and it's
		up to you to keep track of and set the other properties as required.
		
		This can be handy if, for example, you've a nested DOM Element and you don't want the opacity to be
		picked-up by any of its children.
	**/
	var transformOnly : Bool;
	/**
		The angle, in radians, by which to skew the DOM Element on the horizontal axis.
		
		https://developer.mozilla.org/en-US/docs/Web/CSS/transform
	**/
	var skewX : Float;
	/**
		The angle, in radians, by which to skew the DOM Element on the vertical axis.
		
		https://developer.mozilla.org/en-US/docs/Web/CSS/transform
	**/
	var skewY : Float;
	/**
		A Vector4 that contains the 3D rotation of this DOM Element around a fixed axis in 3D space.
		
		All values in the Vector4 are treated as degrees, unless the `rotate3dAngle` property is changed.
		
		For more details see the following MDN page:
		
		https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotate3d
	**/
	var rotate3d : global.phaser.math.Vector4;
	/**
		The unit that represents the 3D rotation values. By default this is `deg` for degrees, but can
		be changed to any supported unit. See this page for further details:
		
		https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotate3d
	**/
	var rotate3dAngle : String;
	/**
		The native (un-scaled) width of this Game Object.
		
		For a DOM Element this property is read-only.
		
		The property `displayWidth` holds the computed bounds of this DOM Element, factoring in scaling.
	**/
	final width : Float;
	/**
		The native (un-scaled) height of this Game Object.
		
		For a DOM Element this property is read-only.
		
		The property `displayHeight` holds the computed bounds of this DOM Element, factoring in scaling.
	**/
	final height : Float;
	/**
		The computed display width of this Game Object, based on the `getBoundingClientRect` DOM call.
		
		The property `width` holds the un-scaled width of this DOM Element.
	**/
	final displayWidth : Float;
	/**
		The computed display height of this Game Object, based on the `getBoundingClientRect` DOM call.
		
		The property `height` holds the un-scaled height of this DOM Element.
	**/
	final displayHeight : Float;
	/**
		Sets the horizontal and vertical skew values of this DOM Element.
		
		For more information see: https://developer.mozilla.org/en-US/docs/Web/CSS/transform
	**/
	function setSkew(?x:Float, ?y:Float):DOMElement;
	/**
		Sets the perspective CSS property of the _parent DOM Container_. This determines the distance between the z=0
		plane and the user in order to give a 3D-positioned element some perspective. Each 3D element with
		z > 0 becomes larger; each 3D-element with z < 0 becomes smaller. The strength of the effect is determined
		by the value of this property.
		
		For more information see: https://developer.mozilla.org/en-US/docs/Web/CSS/perspective
		
		**Changing this value changes it globally for all DOM Elements, as they all share the same parent container.**
	**/
	function setPerspective(value:Float):DOMElement;
	/**
		The perspective CSS property value of the _parent DOM Container_. This determines the distance between the z=0
		plane and the user in order to give a 3D-positioned element some perspective. Each 3D element with
		z > 0 becomes larger; each 3D-element with z < 0 becomes smaller. The strength of the effect is determined
		by the value of this property.
		
		For more information see: https://developer.mozilla.org/en-US/docs/Web/CSS/perspective
		
		**Changing this value changes it globally for all DOM Elements, as they all share the same parent container.**
	**/
	var perspective : Float;
	/**
		Adds one or more native DOM event listeners onto the underlying Element of this Game Object.
		The event is then dispatched via this Game Objects standard event emitter.
		
		For example:
		
		```javascript
		var div = this.add.dom(x, y, element);
		
		div.addListener('click');
		
		div.on('click', handler);
		```
	**/
	function addListener(events:String):DOMElement;
	/**
		Removes one or more native DOM event listeners from the underlying Element of this Game Object.
	**/
	function removeListener(events:String):DOMElement;
	/**
		Creates a native DOM Element, adds it to the parent DOM Container and then binds it to this Game Object,
		so you can control it. The `tagName` should be a string and is passed to `document.createElement`:
		
		```javascript
		this.add.dom().createElement('div');
		```
		
		For more details on acceptable tag names see: https://developer.mozilla.org/en-US/docs/Web/API/Document/createElement
		
		You can also pass in a DOMString or style object to set the CSS on the created element, and an optional `innerText`
		value as well. Here is an example of a DOMString:
		
		```javascript
		this.add.dom().createElement('div', 'background-color: lime; width: 220px; height: 100px; font: 48px Arial', 'Phaser');
		```
		
		And using a style object:
		
		```javascript
		var style = {
		   'background-color': 'lime';
		   'width': '200px';
		   'height': '100px';
		   'font': '48px Arial';
		};
		
		this.add.dom().createElement('div', style, 'Phaser');
		```
		
		If this Game Object already has an Element, it is removed from the DOM entirely first.
		Any event listeners you may have previously created will need to be re-created after this call.
	**/
	function createElement(tagName:String, ?style:Dynamic, ?innerText:String):DOMElement;
	/**
		Binds a new DOM Element to this Game Object. If this Game Object already has an Element it is removed from the DOM
		entirely first. Any event listeners you may have previously created will need to be re-created on the new element.
		
		The `element` argument you pass to this method can be either a string tagName:
		
		```javascript
		<h1 id="heading">Phaser</h1>
		
		this.add.dom().setElement('heading');
		```
		
		Or a reference to an Element instance:
		
		```javascript
		<h1 id="heading">Phaser</h1>
		
		var h1 = document.getElementById('heading');
		
		this.add.dom().setElement(h1);
		```
		
		You can also pass in a DOMString or style object to set the CSS on the created element, and an optional `innerText`
		value as well. Here is an example of a DOMString:
		
		```javascript
		this.add.dom().setElement(h1, 'background-color: lime; width: 220px; height: 100px; font: 48px Arial', 'Phaser');
		```
		
		And using a style object:
		
		```javascript
		var style = {
		   'background-color': 'lime';
		   'width': '200px';
		   'height': '100px';
		   'font': '48px Arial';
		};
		
		this.add.dom().setElement(h1, style, 'Phaser');
		```
	**/
	function setElement(element:ts.AnyOf2<String, js.html.DOMElement>, ?style:Dynamic, ?innerText:String):DOMElement;
	/**
		Takes a block of html from the HTML Cache, that has previously been preloaded into the game, and then
		creates a DOM Element from it. The loaded HTML is set as the `innerHTML` property of the created
		element.
		
		Assume the following html is stored in a file called `loginform.html`:
		
		```html
		<input type="text" name="nameField" placeholder="Enter your name" style="font-size: 32px">
		<input type="button" name="playButton" value="Let's Play" style="font-size: 32px">
		```
		
		Which is loaded into your game using the cache key 'login':
		
		```javascript
		this.load.html('login', 'assets/loginform.html');
		```
		
		You can create a DOM Element from it using the cache key:
		
		```javascript
		this.add.dom().createFromCache('login');
		```
		
		The optional `elementType` argument controls the container that is created, into which the loaded html is inserted.
		The default is a plain `div` object, but any valid tagName can be given.
		
		If this Game Object already has an Element, it is removed from the DOM entirely first.
		Any event listeners you may have previously created will need to be re-created after this call.
	**/
	function createFromCache(The:String, ?tagName:String):DOMElement;
	/**
		Takes a string of html and then creates a DOM Element from it. The HTML is set as the `innerHTML`
		property of the created element.
		
		```javascript
		let form = `
		<input type="text" name="nameField" placeholder="Enter your name" style="font-size: 32px">
		<input type="button" name="playButton" value="Let's Play" style="font-size: 32px">
		`;
		```
		
		You can create a DOM Element from it using the string:
		
		```javascript
		this.add.dom().createFromHTML(form);
		```
		
		The optional `elementType` argument controls the type of container that is created, into which the html is inserted.
		The default is a plain `div` object, but any valid tagName can be given.
		
		If this Game Object already has an Element, it is removed from the DOM entirely first.
		Any event listeners you may have previously created will need to be re-created after this call.
	**/
	function createFromHTML(A:String, ?tagName:String):DOMElement;
	/**
		Removes the current DOM Element bound to this Game Object from the DOM entirely and resets the
		`node` property of this Game Object to be `null`.
	**/
	function removeElement():DOMElement;
	/**
		Internal method that calls `getBoundingClientRect` on the `node` and then sets the bounds width
		and height into the `displayWidth` and `displayHeight` properties, and the `clientWidth` and `clientHeight`
		values into the `width` and `height` properties respectively.
		
		This is called automatically whenever a new element is created or set.
	**/
	function updateSize():DOMElement;
	/**
		Gets all children from this DOM Elements node, using `querySelectorAll('*')` and then iterates through
		them, looking for the first one that has a property matching the given key and value. It then returns this child
		if found, or `null` if not.
	**/
	function getChildByProperty(property:String, value:String):js.html.DOMElement;
	/**
		Gets all children from this DOM Elements node, using `querySelectorAll('*')` and then iterates through
		them, looking for the first one that has a matching id. It then returns this child if found, or `null` if not.
		
		Be aware that class and id names are case-sensitive.
	**/
	function getChildByID(id:String):js.html.DOMElement;
	/**
		Gets all children from this DOM Elements node, using `querySelectorAll('*')` and then iterates through
		them, looking for the first one that has a matching name. It then returns this child if found, or `null` if not.
		
		Be aware that class and id names are case-sensitive.
	**/
	function getChildByName(name:String):js.html.DOMElement;
	/**
		Sets the `className` property of the DOM Element node and updates the internal sizes.
	**/
	function setClassName(className:String):DOMElement;
	/**
		Sets the `innerText` property of the DOM Element node and updates the internal sizes.
		
		Note that only certain types of Elements can have `innerText` set on them.
	**/
	function setText(text:String):DOMElement;
	/**
		Sets the `innerHTML` property of the DOM Element node and updates the internal sizes.
	**/
	function setHTML(html:String):DOMElement;
	/**
		Compares the renderMask with the renderFlags to see if this Game Object will render or not.
		
		DOMElements always return `true` as they need to still set values during the render pass, even if not visible.
	**/
	function willRender():Bool;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():DOMElement;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
	**/
	function setAlpha(?value:Float):DOMElement;
	/**
		The alpha value of the Game Object.
		
		This is a global value, impacting the entire Game Object, not just a region of it.
	**/
	var alpha : Float;
	/**
		Sets the Blend Mode being used by this Game Object.
		
		This can be a const, such as `Phaser.BlendModes.SCREEN`, or an integer, such as 4 (for Overlay)
		
		Under WebGL only the following Blend Modes are available:
		
		* ADD
		* MULTIPLY
		* SCREEN
		* ERASE
		
		Canvas has more available depending on browser support.
		
		You can also create your own custom Blend Modes in WebGL.
		
		Blend modes have different effects under Canvas and WebGL, and from browser to browser, depending
		on support. Blend Modes also cause a WebGL batch flush should it encounter a new blend mode. For these
		reasons try to be careful about the construction of your Scene and the frequency of which blend modes
		are used.
	**/
	var blendMode : ts.AnyOf2<String, global.phaser.BlendModes>;
	/**
		Sets the Blend Mode being used by this Game Object.
		
		This can be a const, such as `Phaser.BlendModes.SCREEN`, or an integer, such as 4 (for Overlay)
		
		Under WebGL only the following Blend Modes are available:
		
		* ADD
		* MULTIPLY
		* SCREEN
		* ERASE (only works when rendering to a framebuffer, like a Render Texture)
		
		Canvas has more available depending on browser support.
		
		You can also create your own custom Blend Modes in WebGL.
		
		Blend modes have different effects under Canvas and WebGL, and from browser to browser, depending
		on support. Blend Modes also cause a WebGL batch flush should it encounter a new blend mode. For these
		reasons try to be careful about the construction of your Scene and the frequency in which blend modes
		are used.
	**/
	function setBlendMode(value:ts.AnyOf2<String, global.phaser.BlendModes>):DOMElement;
	/**
		The depth of this Game Object within the Scene.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	var depth : Float;
	/**
		The depth of this Game Object within the Scene.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	function setDepth(value:Float):DOMElement;
	/**
		The horizontal origin of this Game Object.
		The origin maps the relationship between the size and position of the Game Object.
		The default value is 0.5, meaning all Game Objects are positioned based on their center.
		Setting the value to 0 means the position now relates to the left of the Game Object.
	**/
	var originX : Float;
	/**
		The vertical origin of this Game Object.
		The origin maps the relationship between the size and position of the Game Object.
		The default value is 0.5, meaning all Game Objects are positioned based on their center.
		Setting the value to 0 means the position now relates to the top of the Game Object.
	**/
	var originY : Float;
	/**
		The horizontal display origin of this Game Object.
		The origin is a normalized value between 0 and 1.
		The displayOrigin is a pixel value, based on the size of the Game Object combined with the origin.
	**/
	var displayOriginX : Float;
	/**
		The vertical display origin of this Game Object.
		The origin is a normalized value between 0 and 1.
		The displayOrigin is a pixel value, based on the size of the Game Object combined with the origin.
	**/
	var displayOriginY : Float;
	/**
		Sets the origin of this Game Object.
		
		The values are given in the range 0 to 1.
	**/
	function setOrigin(?x:Float, ?y:Float):DOMElement;
	/**
		Sets the origin of this Game Object based on the Pivot values in its Frame.
	**/
	function setOriginFromFrame():DOMElement;
	/**
		Sets the display origin of this Game Object.
		The difference between this and setting the origin is that you can use pixel values for setting the display origin.
	**/
	function setDisplayOrigin(?x:Float, ?y:Float):DOMElement;
	/**
		Updates the Display Origin cached values internally stored on this Game Object.
		You don't usually call this directly, but it is exposed for edge-cases where you may.
	**/
	function updateDisplayOrigin():DOMElement;
	/**
		The horizontal scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorX : Float;
	/**
		The vertical scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorY : Float;
	/**
		Sets the scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	function setScrollFactor(x:Float, ?y:Float):DOMElement;
	/**
		The x position of this Game Object.
	**/
	var x : Float;
	/**
		The y position of this Game Object.
	**/
	var y : Float;
	/**
		The z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#depth} instead.
	**/
	var z : Float;
	/**
		The w position of this Game Object.
	**/
	var w : Float;
	/**
		This is a special setter that allows you to set both the horizontal and vertical scale of this Game Object
		to the same value, at the same time. When reading this value the result returned is `(scaleX + scaleY) / 2`.
		
		Use of this property implies you wish the horizontal and vertical scales to be equal to each other. If this
		isn't the case, use the `scaleX` or `scaleY` properties instead.
	**/
	var scale : Float;
	/**
		The horizontal scale of this Game Object.
	**/
	var scaleX : Float;
	/**
		The vertical scale of this Game Object.
	**/
	var scaleY : Float;
	/**
		The angle of this Game Object as expressed in degrees.
		
		Phaser uses a right-hand clockwise rotation system, where 0 is right, 90 is down, 180/-180 is left
		and -90 is up.
		
		If you prefer to work in radians, see the `rotation` property instead.
	**/
	var angle : Float;
	/**
		The angle of this Game Object in radians.
		
		Phaser uses a right-hand clockwise rotation system, where 0 is right, PI/2 is down, +-PI is left
		and -PI/2 is up.
		
		If you prefer to work in degrees, see the `angle` property instead.
	**/
	var rotation : Float;
	/**
		Sets the position of this Game Object.
	**/
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):DOMElement;
	/**
		Copies an object's coordinates to this Game Object's position.
	**/
	function copyPosition(source:ts.AnyOf3<global.phaser.types.math.Vector2Like, global.phaser.types.math.Vector3Like, global.phaser.types.math.Vector4Like>):DOMElement;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):DOMElement;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):DOMElement;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):DOMElement;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(x:Float, ?y:Float):DOMElement;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):DOMElement;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):DOMElement;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):DOMElement;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):DOMElement;
	/**
		Gets the local transform matrix for this Game Object.
	**/
	function getLocalTransformMatrix(?tempMatrix:global.phaser.gameobjects.components.TransformMatrix):global.phaser.gameobjects.components.TransformMatrix;
	/**
		Gets the world transform matrix for this Game Object, factoring in any parent Containers.
	**/
	function getWorldTransformMatrix(?tempMatrix:global.phaser.gameobjects.components.TransformMatrix, ?parentMatrix:global.phaser.gameobjects.components.TransformMatrix):global.phaser.gameobjects.components.TransformMatrix;
	/**
		Takes the given `x` and `y` coordinates and converts them into local space for this
		Game Object, taking into account parent and local transforms, and the Display Origin.
		
		The returned Vector2 contains the translated point in its properties.
		
		A Camera needs to be provided in order to handle modified scroll factors. If no
		camera is specified, it will use the `main` camera from the Scene to which this
		Game Object belongs.
	**/
	function getLocalPoint(x:Float, y:Float, ?point:global.phaser.math.Vector2, ?camera:global.phaser.cameras.scene2d.Camera):global.phaser.math.Vector2;
	/**
		Gets the sum total rotation of all of this Game Objects parent Containers.
		
		The returned value is in radians and will be zero if this Game Object has no parent container.
	**/
	function getParentRotation():Float;
	/**
		The visible state of the Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	var visible : Bool;
	/**
		Sets the visibility of this Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	function setVisible(value:Bool):DOMElement;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):DOMElement;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):DOMElement;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):DOMElement;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():DOMElement;
	/**
		Allows you to store a key value pair within this Game Objects Data Manager.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		```javascript
		sprite.setData('name', 'Red Gem Stone');
		```
		
		You can also pass in an object of key value pairs as the first argument:
		
		```javascript
		sprite.setData({ name: 'Red Gem Stone', level: 2, owner: 'Link', gold: 50 });
		```
		
		To get a value back again you can call `getData`:
		
		```javascript
		sprite.getData('gold');
		```
		
		Or you can access the value directly via the `values` property, where it works like any other variable:
		
		```javascript
		sprite.data.values.gold += 50;
		```
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
		
		If the key already exists, a `changedata` event is emitted instead, along an event named after the key.
		For example, if you updated an existing key called `PlayerLives` then it would emit the event `changedata-PlayerLives`.
		These events will be emitted regardless if you use this method to set the value, or the direct `values` setter.
		
		Please note that the data keys are case-sensitive and must be valid JavaScript Object property strings.
		This means the keys `gold` and `Gold` are treated as two unique values within the Data Manager.
	**/
	function setData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):DOMElement;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):DOMElement;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:ts.AnyOf2<String, Dynamic>):DOMElement;
	/**
		Pass this Game Object to the Input Manager to enable it for Input.
		
		Input works by using hit areas, these are nearly always geometric shapes, such as rectangles or circles, that act as the hit area
		for the Game Object. However, you can provide your own hit area shape and callback, should you wish to handle some more advanced
		input detection.
		
		If no arguments are provided it will try and create a rectangle hit area based on the texture frame the Game Object is using. If
		this isn't a texture-bound object, such as a Graphics or BitmapText object, this will fail, and you'll need to provide a specific
		shape for it to use.
		
		You can also provide an Input Configuration Object as the only argument to this method.
	**/
	function setInteractive(?hitArea:Dynamic, ?callback:global.phaser.types.input.HitAreaCallback, ?dropZone:Bool):DOMElement;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():DOMElement;
	/**
		If this Game Object has previously been enabled for input, this will queue it
		for removal, causing it to no longer be interactive. The removal happens on
		the next game step, it is not immediate.
		
		The Interactive Object that was assigned to this Game Object will be destroyed,
		removed from the Input Manager and cleared from this Game Object.
		
		If you wish to re-enable this Game Object at a later date you will need to
		re-create its InteractiveObject by calling `setInteractive` again.
		
		If you wish to only temporarily stop an object from receiving input then use
		`disableInteractive` instead, as that toggles the interactive state, where-as
		this erases it completely.
		
		If you wish to resize a hit area, don't remove and then set it as being
		interactive. Instead, access the hitarea object directly and resize the shape
		being used. I.e.: `sprite.input.hitArea.setSize(width, height)` (assuming the
		shape is a Rectangle, which it is by default.)
	**/
	function removeInteractive():DOMElement;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):DOMElement;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):DOMElement;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):DOMElement;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):DOMElement;
	static var prototype : DOMElement;
}