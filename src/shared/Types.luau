--!strict
-- Shared type definitions for config-driven combat data.

export type Hitbox = {
	-- Offset from the fighter's origin, in studs, facing right.
	offset: Vector2,
	radius: number,
	-- Frame range (inclusive, 1-based from move start) this hitbox is live.
	startFrame: number,
	endFrame: number,
	damage: number,
	-- Launch angle in degrees, 0 = forward, 90 = up.
	angle: number,
	baseKnockback: number,
	knockbackScaling: number,
}

export type MoveData = {
	name: string,
	startup: number,
	active: number,
	endlag: number,
	hitboxes: { Hitbox },
}

export type CharacterStats = {
	displayName: string,
	weight: number,
	gravity: number,
	fallSpeed: number,
	fastFallSpeed: number,
	walkSpeed: number,
	runSpeed: number,
	airSpeed: number,
	airAcceleration: number,
	jumpHeight: number,
	shortHopHeight: number,
	doubleJumpHeight: number,
	jumpCount: number,
}

return {}
