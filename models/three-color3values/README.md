* Roblox Studio version: 0.438.0.407270

Contains eighteen `Color3Values`s, the first fifteen of which were generated using the following Roblox Lua code:

```lua
local t = {0, 0, 0}

for i = 1, 3 do
    for j = 5, 9  do
        t[i] = 2^(j-1) - 1

        local color3 = Instance.new("Color3Value")
        color3.Value = Color3.fromRGB(table.unpack(t))
        color3.Parent = workspace

        t = {0, 0, 0}
    end
end
```
The last three `Color3Value`s are the following HDR `Color3`s:

* Color3.FromRGB(0, 128, 256)
* Color3.FromRGB(128, 256, 384)
* Color3.FromRGB(256, 384, 512)