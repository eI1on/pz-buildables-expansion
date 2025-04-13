local SketchDatabase = require("BuildablesExpansion/SketchDatabase")
local Sketches = SketchDatabase.Sketches

local SketchBookUI = require("BuildablesExpansion/SketchBookSystem/SketchBookUI")

local SketchBookSystem = {}

local function predicateNotBroken(item)
    return not item:isBroken()
end

function SketchBookSystem.dbgAddAllSketches(items, playerObj, sketchbook)
    local sketchbookModData = sketchbook:getModData()
    sketchbookModData["BuildersSketches"] = sketchbookModData["BuildersSketches"] or {}
    for sketchName in pairs(Sketches) do
        if not sketchbookModData["BuildersSketches"][sketchName] then
            sketchbookModData["BuildersSketches"][sketchName] = true
        end
    end
end

function SketchBookSystem.lookAtBlueprints(items, playerObj, sketchbook)
    local sketchbookUI = SketchBookUI:new(0, 0, sketchbook, playerObj)
    sketchbookUI:addToUIManager()
    sketchbookUI:setVisible(true)
end

function SketchBookSystem.startSketchingBlueprints(items, playerObj, sketchbook, writingTool)
    SketchBookSystem.cursor = SketchBookCursor:new(playerObj, items, sketchbook, writingTool)
    getCell():setDrag(SketchBookSystem.cursor, playerObj:getPlayerNum())
end

---@param playerNum integer
---@param context ISContextMenu
---@param items ContextMenuItemStack[]|InventoryItem[]
function SketchBookSystem.doContextMenu(playerNum, context, items)
    local actualItems = ISInventoryPane.getActualItems(items)
    local playerObj = getSpecificPlayer(playerNum)
    local playerInv = playerObj:getInventory()

    for i = 1, #actualItems do
        local item = actualItems[i]
        if item:getType() == "BuildersSketchbook" then
            context:removeOptionByName(getText("ContextMenu_Read"))

            local asleep = playerObj:isAsleep()
            ---@diagnostic disable-next-line: undefined-field
            local illiterate = playerObj:getTraits():isIlliterate()
            local tooDarkToRead = playerObj:tooDarkToRead()

            local lookAtBlueprintsOption = context:addOption(getText("ContextMenu_LookAtBlueprints"), actualItems,
                SketchBookSystem.lookAtBlueprints, playerObj, item)

            if asleep or illiterate or tooDarkToRead then
                lookAtBlueprintsOption.notAvailable = true
                local tooltip = ISInventoryPaneContextMenu.addToolTip()
                tooltip.description = (asleep and getText("ContextMenu_NoOptionSleeping"))
                    or (tooDarkToRead and getText("ContextMenu_TooDarkToDraw"))
                    or (illiterate and getText("ContextMenu_Illiterate"))
                lookAtBlueprintsOption.toolTip = tooltip
            end

            local writingTool = playerInv:getFirstTagEvalRecurse("Write", predicateNotBroken)

            local writeOption = context:addOption(getText("ContextMenu_StartSketchingBlueprints"), actualItems,
                SketchBookSystem.startSketchingBlueprints, playerObj, item, writingTool)

            if asleep or illiterate or tooDarkToRead or (not writingTool) then
                writeOption.notAvailable = true
                local tooltip = ISInventoryPaneContextMenu.addToolTip()
                tooltip.description = (asleep and getText("ContextMenu_NoOptionSleeping"))
                    or (tooDarkToRead and getText("ContextMenu_TooDarkToDraw"))
                    or (illiterate and getText("ContextMenu_Illiterate"))
                    or ((not writingTool) and getText("Tooltip_Map_CantWrite"))
                writeOption.toolTip = tooltip
            end

            local dbgAddAllSketchesOption = context:addOption("Add All Sketches", actualItems,
                SketchBookSystem.dbgAddAllSketches, playerObj, item)
            break
        end
    end
end

Events.OnFillInventoryObjectContextMenu.Remove(SketchBookSystem.doContextMenu)
Events.OnFillInventoryObjectContextMenu.Add(SketchBookSystem.doContextMenu)
