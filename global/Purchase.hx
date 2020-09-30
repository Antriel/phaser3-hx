package global;

typedef Purchase = {
	/**
		A developer-specified string, provided during the purchase of the product.
	**/
	@:optional
	var developerPayload : String;
	/**
		The identifier for the purchase transaction.
	**/
	@:optional
	var paymentID : String;
	/**
		The product's game-specified identifier.
	**/
	@:optional
	var productID : String;
	/**
		Unix timestamp of when the purchase occurred.
	**/
	@:optional
	var purchaseTime : String;
	/**
		A token representing the purchase that may be used to consume the purchase.
	**/
	@:optional
	var purchaseToken : String;
	/**
		Server-signed encoding of the purchase request.
	**/
	@:optional
	var signedRequest : String;
};