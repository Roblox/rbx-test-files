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

local function addToListSet(listSet, newValue)
	local newSet = {}
	for _, value in ipairs(listSet) do
		table.insert(newSet, value)
	end
	table.insert(newSet, newValue)

	return newSet
end

local function generateAxes(currentSet, startIndex)
	for i = startIndex, #allAxes do
		local nextSet = addToListSet(currentSet, allAxes[i])
		addHandle(nextSet)
		generateAxes(nextSet, i + 1)
	end
end

addHandle({})
generateAxes({}, 1)

game.Selection:Set(childrenInOrder)