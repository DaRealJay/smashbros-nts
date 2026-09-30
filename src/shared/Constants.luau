--!strict
-- Global tuning constants shared by client and server.
-- Per-move and per-character numbers do NOT go here; they live in Config/.

local Constants = {
	-- All frame data in Config assumes this logic rate.
	TICK_RATE = 60,
	FRAME_TIME = 1 / 60,

	-- hitstun (frames) = knockback * HITSTUN_MULTIPLIER
	HITSTUN_MULTIPLIER = 0.4,

	-- Fighters move on the X/Y plane only; Z is locked to this value.
	PLANE_Z = 0,

	MAX_PLAYERS = 4,
	DEFAULT_STOCKS = 3,
}

return table.freeze(Constants)
