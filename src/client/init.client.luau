--!strict
-- Client entry point. Requires every ModuleScript in Controllers, calls Init
-- on all of them, then Start on all of them.

type Controller = {
	Init: ((self: Controller) -> ())?,
	Start: ((self: Controller) -> ())?,
}

local controllersFolder = script:WaitForChild("Controllers")
local controllers: { Controller } = {}

for _, child in controllersFolder:GetChildren() do
	if child:IsA("ModuleScript") then
		table.insert(controllers, (require :: any)(child))
	end
end

for _, controller in controllers do
	if controller.Init then
		controller:Init()
	end
end

for _, controller in controllers do
	if controller.Start then
		task.spawn(controller.Start, controller)
	end
end
