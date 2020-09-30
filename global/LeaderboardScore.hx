package global;

typedef LeaderboardScore = {
	/**
		An integer score value.
	**/
	var score : Float;
	/**
		The score value, formatted with the score format associated with the leaderboard.
	**/
	var scoreFormatted : String;
	/**
		The Unix timestamp of when the leaderboard entry was last updated.
	**/
	var timestamp : Float;
	/**
		The entry's leaderboard ranking.
	**/
	var rank : Float;
	/**
		The developer-specified payload associated with the score, or null if one was not set.
	**/
	var data : String;
	/**
		The player's localized display name.
	**/
	var playerName : String;
	/**
		A url to the player's public profile photo.
	**/
	var playerPhotoURL : String;
	/**
		The game's unique identifier for the player.
	**/
	var playerID : String;
};