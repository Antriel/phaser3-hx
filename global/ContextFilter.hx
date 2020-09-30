package global;

/**
	A filter that may be applied to a Context Choose operation.
	
	'NEW_CONTEXT_ONLY' - Prefer to only surface contexts the game has not been played in before.
	'INCLUDE_EXISTING_CHALLENGES' - Include the "Existing Challenges" section, which surfaces actively played-in contexts that the player is a part of.
	'NEW_PLAYERS_ONLY' - In sections containing individuals, prefer people who have not played the game.
**/
typedef ContextFilter = String;