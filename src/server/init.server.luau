--!strict
-- Server entry point. Requires every ModuleScript in Services, calls Init on
-- all of them, then Start on all of them.

type Service = {
	Init: ((self: Service) -> ())?,
	Start: ((self: Service) -> ())?,
}

local servicesFolder = script:WaitForChild("Services")
local services: { Service } = {}

for _, child in servicesFolder:GetChildren() do
	if child:IsA("ModuleScript") then
		table.insert(services, (require :: any)(child))
	end
end

for _, service in services do
	if service.Init then
		service:Init()
	end
end

for _, service in services do
	if service.Start then
		task.spawn(service.Start, service)
	end
end
