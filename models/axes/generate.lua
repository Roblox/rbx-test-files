--[[
	Generates the models used in this example.

	Use Roblox Studio's 'Run Script' dialog to run this file, then save what it
	selects.
]]

local childrenInOrder = {}
local container = Instance.new("Folder")
container.Name = "Axes"
container.Parent = game.Workspace

local allAxes = { Enum.Axis.X, Enum.Axis.Y, Enum.Axis.Z }

local function addHandle(axisList)
	local axes = Axes.new(unpack(axisList))

	local handle = Instance.new("ArcHandles")
	handle.Axes = axes
	handle.Name = tostring(axes)
	handle.Parent = container

	table.insert(childrenInOrder, handle)
end

local function generateAxes(set, startIndex)
	for i = startIndex, #allAxes do
		table.insert(set, allAxes[i])
		addHandle(set)
		generateAxes(set, i + 1)
		table.remove(set)
	end
end

addHandle({})
generateAxes({}, 1)

game.Selection:Set(childrenInOrder)