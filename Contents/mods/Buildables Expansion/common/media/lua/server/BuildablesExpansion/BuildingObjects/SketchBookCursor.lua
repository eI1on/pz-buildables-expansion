local Utils = require("BuildablesExpansion/Utils")

local SketchDatabase = require("BuildablesExpansion/SketchDatabase")
local Sketches = SketchDatabase.Sketches

SketchBookCursor = ISBuildingObject:derive("SketchBookCursor")

local function predicateNotBroken(item)
    return not item:isBroken()
end

function SketchBookCursor:create(x, y, z, north, sprite)
    self:hideTooltip()
    local playerObj = self.character
    local playerInv = playerObj:getInventory()
    local object = self:getObjectListCached()[self.objectIndex]

    local writingTool = playerInv:getFirstTagEvalRecurse("Write", predicateNotBroken)
    local sketchbook = self.sketchbook
    if not writingTool or not sketchbook then return end

    ISWorldObjectContextMenu.equip(playerObj, playerObj:getSecondaryHandItem(), sketchbook, false, false)
    ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), writingTool, true, false)

    if not AdjacentFreeTileFinder.isTileOrAdjacent(playerObj:getCurrentSquare(), object:getSquare()) then
        local adjacent = AdjacentFreeTileFinder.Find(object:getSquare(), playerObj)
        if adjacent then
            ISTimedActionQueue.add(ISWalkToTimedAction:new(playerObj, adjacent))
        end
    end
    ISTimedActionQueue.add(DrawInSketchbookAction:new(playerObj, object, sketchbook))
end

function SketchBookCursor:walkTo(x, y, z)
	local square = getCell():getGridSquare(x, y, z)
    local object = self:getObjectList()[self.objectIndex]

    local props = object:getProperties()
    self.isWallLike = props:Is("WallN") or props:Is("WallW") or props:Is("WallNTrans") or props:Is("WallWTrans") or props:Is("WindowN") or props:Is("WindowW") or props:Is("DoorWallN") or props:Is("DoorWallW")

	if self.isWallLike then
		return luautils.walkAdjWall(self.character, square, self.north)
	else
		return luautils.walkAdj(self.character, square)
	end
end

function SketchBookCursor:rotateKey(key)
    if getCore():isKey("Rotate building", key) then
        self.objectIndex = self.objectIndex + 1
        local objects = self:getObjectList()
        if self.objectIndex > #objects then
            self.objectIndex = 1
        end
    end
end

function SketchBookCursor:isValid(square)
    self.renderX = square:getX()
    self.renderY = square:getY()
    self.renderZ = square:getZ()
    local objects = self:getObjectListCached()
    if self.objectIndex >= 1 and self.objectIndex <= #objects then
        local object = objects[self.objectIndex]
        local objSprite = object:getSprite()
        local spriteProps = objSprite:getProperties()
        local entityName = spriteProps:Is("EntityScriptName") and spriteProps:Val("EntityScriptName")

        local sketchbookModData = self.sketchbook:getModData()

        if sketchbookModData["BuildersSketches"] then
            if sketchbookModData["BuildersSketches"][entityName] then
                return false
            else
                return true
            end
        end
    end
    return #objects > 0
end

function SketchBookCursor:getObjectListCached()
    if self.cachedObjects and self.currentSquare == self.cachedSquare then
        return self.cachedObjects
    end
    self.cachedSquare = self.currentSquare
    self.cachedObjects = self:getObjectList()
    return self.cachedObjects
end

function SketchBookCursor:render(x, y, z, square)
    local hc = getCore():getGoodHighlitedColor()
    if not self:isValid(square) then
        hc = getCore():getBadHighlitedColor()
    end
    self:getFloorCursorSprite():RenderGhostTileColor(x, y, z, hc:getR(), hc:getG(), hc:getB(), 0.8)

    if self.currentSquare ~= square then
        self.objectIndex = 1
        self.currentSquare = square
        self.cachedObjects = nil
    end

    self.renderX = x
    self.renderY = y
    self.renderZ = z

    local objects = self:getObjectListCached()
    if self.objectIndex >= 1 and self.objectIndex <= #objects then
        local object = objects[self.objectIndex]
        local color = { r = 0.49, g = 0.70, b = 0.80, a = 1 }

        local stairObjects = buildUtil.getStairObjects(object)
        local doubleDoorObjects = buildUtil.getDoubleDoorObjects(object)
        local garageDoorObjects = buildUtil.getGarageDoorObjects(object)
        local graveObjects = buildUtil.getGraveObjects(object)
        if #stairObjects > 0 then
            for i = 1, #stairObjects do
                local stairObj = stairObjects[i]
                stairObj:getSprite():RenderGhostTileColor(stairObj:getX(), stairObj:getY(),
                    stairObj:getZ(), color.r, color.g, color.b, color.a)
            end
        elseif #doubleDoorObjects > 0 then
            for i = 1, #doubleDoorObjects do
                local doubleDoorObj = doubleDoorObjects[i]
                doubleDoorObj:getSprite():RenderGhostTileColor(doubleDoorObj:getX(), doubleDoorObj:getY(),
                    doubleDoorObj:getZ(), color.r, color.g, color.b, color.a)
            end
        elseif #garageDoorObjects > 0 then
            for i = 1, #garageDoorObjects do
                local garageDoorObj = garageDoorObjects[i]
                garageDoorObj:getSprite():RenderGhostTileColor(garageDoorObj:getX(), garageDoorObj:getY(),
                    garageDoorObj:getZ(), color.r, color.g, color.b, color.a)
            end
        elseif #graveObjects > 0 then
            for i = 1, #graveObjects do
                local graveObj = graveObjects[i]
                graveObj:getSprite():RenderGhostTileColor(graveObj:getX(), graveObj:getY(), graveObj:getZ(),
                    color.r, color.g, color.b, color.a)
            end
        else
            local xOffset, yOffset = 0, object:getRenderYOffset() * Core.getTileScale()
            object:getSprite():RenderGhostTileColor(x, y, z, xOffset, yOffset, color.r, color.g, color.b, color.a)
        end
    end
    self:renderTooltip()
end

function SketchBookCursor:deactivate()
    self:hideTooltip()
end

function SketchBookCursor:hideTooltip()
    if self.tooltip then
        self.tooltip:removeFromUIManager()
        self.tooltip:setVisible(false)
        self.tooltip = nil
    end
end

function SketchBookCursor:renderTooltip()
    local object = self:getObjectListCached()[self.objectIndex]
    if not object then
        self:hideTooltip()
        return
    end

    if not self.tooltip then
        self.tooltip = ISWorldObjectContextMenu.addToolTip()
        self.tooltip:setVisible(true)
        self.tooltip:addToUIManager()
        self.tooltip.followMouse = not self.joyfocus
        self.tooltip.maxLineWidth = 1000
    end

    local name = GameEntity.getDefaultEntityDisplayName()
    local objSprite = object:getSprite()
    local texture = objSprite:getName()

    if texture then
        self.tooltip:setTexture(texture)
    end

    local spriteProps = objSprite:getProperties()
    local sketchStatus = ""
    local entityName = spriteProps:Is("EntityScriptName") and spriteProps:Val("EntityScriptName")

    if entityName and Sketches[entityName] then
        name = self.displayNameMap[entityName]

        local sketchbookModData = self.sketchbook:getModData()
        if sketchbookModData["BuildersSketches"] and sketchbookModData["BuildersSketches"][entityName] then
            sketchStatus = " <RED> " .. getText("Tooltip_SketchBook_AlreadySketched") .. " <POPRGB> "
        else
            sketchStatus = " <GREEN> " .. getText("Tooltip_SketchBook_CanSketch") .. " <POPRGB> "
        end
    else
        sketchStatus = "<RED> " .. getText("Tooltip_SketchBook_CannotSketch") .. " <POPRGB> "
    end
    self.tooltip:setName(name)

    self.tooltip.description = " <H2> " .. getText("Tooltip_SketchBook_SketchStatus") .. " </H2><LINE> " .. sketchStatus
    self.tooltip.footNote = "'" ..
    Keyboard.getKeyName(getCore():getKey("Rotate building")) .. "' = " .. getText("IGUI_Cycle1")
end

function SketchBookCursor:onJoypadPressButton(joypadIndex, joypadData, button)
    if button == Joypad.AButton or button == Joypad.BButton then
        return ISBuildingObject.onJoypadPressButton(self, joypadIndex, joypadData, button)
    end

    if button == Joypad.RBumper then
        self.objectIndex = self.objectIndex + 1
        local objects = self:getObjectList()
        if self.objectIndex > #objects then
            self.objectIndex = 1
        end
    end

    if button == Joypad.LBumper then
        self.objectIndex = self.objectIndex - 1
        if self.objectIndex < 1 then
            local objects = self:getObjectList()
            self.objectIndex = #objects
        end
    end
end

function SketchBookCursor:getAPrompt()
    if #self:getObjectList() > 0 then
        return getText("ContextMenu_StartSketchingBlueprints")
    end
    return nil
end

function SketchBookCursor:getLBPrompt()
    if #self:getObjectList() > 1 then
        return "Previous Object"
    end
    return nil
end

function SketchBookCursor:getRBPrompt()
    if #self:getObjectList() > 1 then
        return "Next Object"
    end
    return nil
end

---@param object IsoObject
---@return boolean
function SketchBookCursor:canBeSketched(object)
    if not object or not object:getSquare() or not object:getSprite() then return false end
    if not object:getSquare():isCouldSee(self.player) then return false end

    local isoSprite = object:getSprite()
    local spriteProps = isoSprite:getProperties()

    if spriteProps:Is("EntityScriptName") and Sketches[spriteProps:Val("EntityScriptName")] then
        return true
    end
    return false
end

function SketchBookCursor:getObjectList()
    local square = getCell():getGridSquare(self.renderX, self.renderY, self.renderZ)
    if not square then return {} end
    local objects = {}
    for i = square:getObjects():size(), 1, -1 do
        local object = square:getObjects():get(i - 1)
        if self:canBeSketched(object) then
            table.insert(objects, object)
        end
    end
    return objects
end

function SketchBookCursor:new(playerObj, items, sketchbook, writingTool)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o:init()
    o.character = playerObj
    o.player = playerObj:getPlayerNum()
    o.items = items
    o.sketchbook = sketchbook
    o.writingTool = writingTool
    o.noNeedHammer = true
    o.skipBuildAction = true
    o.objectIndex = 1
    o.renderX = -1
    o.renderY = -1
    o.renderZ = -1
    o.displayNameMap = Utils.buildDisplayNameMap()
    return o
end
