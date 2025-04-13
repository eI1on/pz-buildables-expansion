local Properties = require("ElyonLib/SpritesUtils/Properties")
local Logger = require("BuildablesExpansion/Logger")

local originalOnMouseDown = BrushToolTilePickerList.onMouseDown
---@diagnostic disable-next-line: duplicate-set-field
function BrushToolTilePickerList:onMouseDown(x, y)
    if isDebugEnabled() then
        local c = (x - (x % 64)) / 64
        local r = (y - (y % 128)) / 128
        if c >= 0 and c < 8 and r >= 0 and r < 128 then
            if self.posToTileNameTable[r + 1] ~= nil and self.posToTileNameTable[r + 1][c + 1] ~= nil then
                local tileName = self.posToTileNameTable[r + 1][c + 1]
                Clipboard.setClipboard(tileName)
                Logger:debug(tileName)
                -- Properties.printPropNamesFromSprite(tileName)
            end
        end
    end
    return originalOnMouseDown(self, x, y)
end
