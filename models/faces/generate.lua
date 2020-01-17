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

local function generateFaces(set, startIndex)
	for i = startIndex, #allFaces do
		table.insert(set, allFaces[i])
		addHandle(set)
		generateFaces(set, i + 1)
		table.remove(set)
	end
end

addHandle({})
generateFaces({}, 1)

game.Selection:Set(childrenInOrder)