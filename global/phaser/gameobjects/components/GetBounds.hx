package global.phaser.gameobjects.components;

/**
	Provides methods used for obtaining the bounds of a Game Object.
	Should be applied as a mixin and not used directly.
**/
typedef GetBounds = {
	/**
		Gets the center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getCenter<O>(?output:O):O;
	/**
		Gets the top-left corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getTopLeft<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the top-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getTopCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the top-right corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getTopRight<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the left-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getLeftCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the right-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getRightCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-left corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getBottomLeft<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getBottomCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-right corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getBottomRight<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bounds of this Game Object, regardless of origin.
		The values are stored and returned in a Rectangle, or Rectangle-like, object.
	**/
	function getBounds<O>(?output:O):O;
};