# Notes for Claude

Read README.md for layout and conventions. In short: Luau with `--!strict`,
Rojo layout under `src/`, server-authoritative combat, custom 2D controller
(no Roblox physics or Humanoid movement for fighters), and all move and
character data in `src/shared/Config`. Original characters only; never use
real anime characters or names.

Before pushing, run `selene src`, `stylua --check src` and
`rojo build -o build.rbxl`.
