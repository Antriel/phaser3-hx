package global.phaser.gameobjects;

/**
	The Game Object Creator is a Scene plugin that allows you to quickly create many common
	types of Game Objects and return them. Unlike the Game Object Factory, they are not automatically
	added to the Scene.
	
	Game Objects directly register themselves with the Creator and inject their own creation
	methods into the class.
**/
@:native("Phaser.GameObjects.GameObjectCreator") extern class GameObjectCreator {
	function new(scene:global.phaser.Scene);
	/**
		Creates a new Dynamic Bitmap Text Game Object and returns it.
		
		Note: This method will only be available if the Dynamic Bitmap Text Game Object has been built into Phaser.
	**/
	function dynamicBitmapText(config:global.phaser.types.gameobjects.bitmaptext.BitmapTextConfig, ?addToScene:Bool):DynamicBitmapText;
	/**
		Creates a new Bitmap Text Game Object and returns it.
		
		Note: This method will only be available if the Bitmap Text Game Object has been built into Phaser.
	**/
	function bitmapText(config:global.phaser.types.gameobjects.bitmaptext.BitmapTextConfig, ?addToScene:Bool):BitmapText;
	/**
		Creates a new Blitter Game Object and returns it.
		
		Note: This method will only be available if the Blitter Game Object has been built into Phaser.
	**/
	function blitter(config:Dynamic, ?addToScene:Bool):Blitter;
	/**
		Creates a new Container Game Object and returns it.
		
		Note: This method will only be available if the Container Game Object has been built into Phaser.
	**/
	function container(config:Dynamic, ?addToScene:Bool):Container;
	/**
		The Scene to which this Game Object Creator belongs.
	**/
	private var scene : global.phaser.Scene;
	/**
		A reference to the Scene.Systems.
	**/
	private var systems : global.phaser.scenes.Systems;
	/**
		A reference to the Scene Display List.
	**/
	private var displayList : DisplayList;
	/**
		A reference to the Scene Update List.
	**/
	private var updateList : UpdateList;
	/**
		Creates a new Graphics Game Object and returns it.
		
		Note: This method will only be available if the Graphics Game Object has been built into Phaser.
	**/
	function graphics(config:Dynamic, ?addToScene:Bool):Graphics;
	/**
		Creates a new Group Game Object and returns it.
		
		Note: This method will only be available if the Group Game Object has been built into Phaser.
	**/
	function group(config:ts.AnyOf2<global.phaser.types.gameobjects.group.GroupConfig, global.phaser.types.gameobjects.group.GroupCreateConfig>):Group;
	/**
		Creates a new Image Game Object and returns it.
		
		Note: This method will only be available if the Image Game Object has been built into Phaser.
	**/
	function image(config:Dynamic, ?addToScene:Bool):Image;
	/**
		Creates a new Mesh Game Object and returns it.
		
		Note: This method will only be available if the Mesh Game Object and WebGL support have been built into Phaser.
	**/
	function mesh(config:Dynamic, ?addToScene:Bool):Mesh;
	/**
		Creates a new Particle Emitter Manager Game Object and returns it.
		
		Note: This method will only be available if the Particles Game Object has been built into Phaser.
	**/
	function particles(config:Dynamic, ?addToScene:Bool):global.phaser.gameobjects.particles.ParticleEmitterManager;
	/**
		Creates a new Quad Game Object and returns it.
		
		Note: This method will only be available if the Quad Game Object and WebGL support have been built into Phaser.
	**/
	function quad(config:Dynamic, ?addToScene:Bool):Quad;
	/**
		Creates a new Render Texture Game Object and returns it.
		
		Note: This method will only be available if the Render Texture Game Object has been built into Phaser.
	**/
	function renderTexture(config:global.phaser.types.gameobjects.rendertexture.RenderTextureConfig, ?addToScene:Bool):RenderTexture;
	/**
		Creates a new Rope Game Object and returns it.
		
		Note: This method will only be available if the Rope Game Object and WebGL support have been built into Phaser.
	**/
	function rope(config:Dynamic, ?addToScene:Bool):Rope;
	/**
		Creates a new Shader Game Object and returns it.
		
		Note: This method will only be available if the Shader Game Object and WebGL support have been built into Phaser.
	**/
	function shader(config:Dynamic, ?addToScene:Bool):Shader;
	/**
		Creates a new Sprite Game Object and returns it.
		
		Note: This method will only be available if the Sprite Game Object has been built into Phaser.
	**/
	function sprite(config:global.phaser.types.gameobjects.sprite.SpriteConfig, ?addToScene:Bool):Sprite;
	/**
		Creates a new Text Game Object and returns it.
		
		Note: This method will only be available if the Text Game Object has been built into Phaser.
	**/
	function text(config:Dynamic, ?addToScene:Bool):Text;
	/**
		Creates a new TileSprite Game Object and returns it.
		
		Note: This method will only be available if the TileSprite Game Object has been built into Phaser.
	**/
	function tileSprite(config:global.phaser.types.gameobjects.tilesprite.TileSpriteConfig, ?addToScene:Bool):TileSprite;
	/**
		Creates a new Video Game Object and returns it.
		
		Note: This method will only be available if the Video Game Object has been built into Phaser.
	**/
	function video(config:Dynamic, ?addToScene:Bool):Video;
	/**
		Creates a new Zone Game Object and returns it.
		
		Note: This method will only be available if the Zone Game Object has been built into Phaser.
	**/
	function zone(config:Dynamic):Zone;
	/**
		Creates a Tilemap from the given key or data, or creates a blank Tilemap if no key/data provided.
		When loading from CSV or a 2D array, you should specify the tileWidth & tileHeight. When parsing
		from a map from Tiled, the tileWidth, tileHeight, width & height will be pulled from the map
		data. For an empty map, you should specify tileWidth, tileHeight, width & height.
	**/
	function tilemap(?config:global.phaser.types.tilemaps.TilemapConfig):global.phaser.tilemaps.Tilemap;
	/**
		Creates a new Tween object and returns it.
		
		Note: This method will only be available if Tweens have been built into Phaser.
	**/
	function tween(config:ts.AnyOf2<Dynamic, global.phaser.types.tweens.TweenBuilderConfig>):global.phaser.tweens.Tween;
	static var prototype : GameObjectCreator;
}