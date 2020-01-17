--[[
	Generates the models used in this example.

	Use Roblox Studio's 'Run Script' dialog to run this file, then save what it
	selects.
]]

local childrenInOrder = {}
local container = Instance.new("Folder")
container.Name = "Faces"
container.Parent = game.Workspace

local allFaces = {
	Enum.NormalId.Right, Enum.NormalId.Top, Enum.NormalId.Back,
	Enum.NormalId.Left, Enum.NormalId.Bottom, Enum.NormalId.Front,
}

local function addHandle(faceList)
	local faces = Faces.new(unpack(faceList))

	local handle = Instance.new("Handles")
	handle.Faces = faces
	handle.Name = tostring(faces)
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

local function generateFaces(currentSet, startIndex)
	for i = startIndex, #allFaces do
		local nextSet = addToListSet(currentSet, allFaces[i])
		addHandle(nextSet)
		generateFaces(nextSet, i + 1)
	end
end

addHandle({})
generateFaces({}, 1)

game.Selection:Set(childrenInOrder)