# SmashBros NTSL

An anime-styled platform fighter for Roblox: Smash-style percent damage,
scaling knockback, stocks, ledges and blast zones, with an original roster
built on shonen archetypes.

## Setup

1. Install [Rokit](https://github.com/rojo-rbx/rokit), then run `rokit install`
   in this folder to get the pinned Rojo, selene and StyLua.
2. Install the Rojo plugin in Roblox Studio (`rojo plugin install`).
3. Run `rojo serve`, open a place in Studio, and click **Connect** in the
   Rojo plugin.

To build a place file without Studio: `rojo build -o build.rbxl`.

## Layout

| Folder | Roblox location | What goes there |
| --- | --- | --- |
| `src/shared` | `ReplicatedStorage.Shared` | Constants, types, config, shared logic |
| `src/shared/Config/Characters` | | Per-character stats (weight, gravity, fall speed) |
| `src/shared/Config/Moves` | | Per-character move data (damage, angle, KB, frames, hitboxes) |
| `src/shared/Modules` | | Pure shared logic (knockback, controller step) |
| `src/server` | `ServerScriptService.Server` | Server entry point |
| `src/server/Services` | | Match state, hit validation, damage |
| `src/client` | `StarterPlayer.StarterPlayerScripts.Client` | Client entry point |
| `src/client/Controllers` | | Input, 2D controller, camera, local hit detection |

Services and controllers are ModuleScripts returning a table with optional
`Init` and `Start` methods; the entry scripts call every `Init`, then every
`Start`.

## Conventions

- Every Luau file starts with `--!strict`.
- Server-authoritative: clients detect hits for responsiveness, the server
  validates range, timing and move state before applying damage and knockback.
- Fighters use a custom 2D-locked controller, not Roblox physics or default
  Humanoid movement.
- All move and character numbers live in `Config`, never in logic.
- Knockback uses the Smash formula; hitstun = knockback * 0.4 frames.
- Frame data assumes 60 fps logic.

## Checks

```sh
selene src
stylua --check src
rojo build -o build.rbxl
```

CI runs the same checks on every push and pull request.
