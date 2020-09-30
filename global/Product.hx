package global;

typedef Product = {
	/**
		The title of the product.
	**/
	@:optional
	var title : String;
	/**
		The product's game-specified identifier.
	**/
	@:optional
	var productID : String;
	/**
		The product description.
	**/
	@:optional
	var description : String;
	/**
		A link to the product's associated image.
	**/
	@:optional
	var imageURI : String;
	/**
		The price of the product.
	**/
	@:optional
	var price : String;
	/**
		The currency code for the product.
	**/
	@:optional
	var priceCurrencyCode : String;
};