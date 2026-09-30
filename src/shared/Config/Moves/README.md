One ModuleScript per character returning `{ [moveName]: Types.MoveData }`,
e.g. `Config/Moves/<CharacterName>.luau`. All damage, angles, knockback,
frame data and hitboxes live here, never in combat logic.
