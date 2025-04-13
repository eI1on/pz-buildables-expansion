DrawInSketchbookAction = ISBaseTimedAction:derive("DrawInSketchbookAction")


function DrawInSketchbookAction:isValid()
    if self.character:tooDarkToRead() then
        HaloTextHelper.addBadText(self.character, getText("ContextMenu_TooDarkToDraw"))
        return false
    end
    local vehicle = self.character:getVehicle()
    if vehicle and vehicle:isDriver(self.character) then
        return not vehicle:isEngineRunning() or vehicle:getSpeed2D() == 0
    end
    if isClient() and self.sketchbook then
        return self.character:getInventory():containsID(self.sketchbook:getID())
    else
        return self.character:getInventory():contains(self.sketchbook)
    end
end

function DrawInSketchbookAction:waitToStart()
    self.character:faceThisObject(self.object)
    return self.character:shouldBeTurning()
end

function DrawInSketchbookAction:update()
    self.character:faceThisObject(self.object)

    local bodyDamage = self.character:getBodyDamage()
    local stats = self.character:getStats()
    if self.stats and (self.sketchbook:getBoredomChange() < 0.0) then
        if bodyDamage:getBoredomLevel() > self.stats.boredom then
            bodyDamage:setBoredomLevel(self.stats.boredom)
        end
    end
    if self.stats and (self.sketchbook:getUnhappyChange() < 0.0) then
        if bodyDamage:getUnhappynessLevel() > self.stats.unhappyness then
            bodyDamage:setUnhappynessLevel(self.stats.unhappyness)
        end
    end
    if self.stats and (self.sketchbook:getStressChange() < 0.0) then
        if stats:getBasicStress() > self.stats.stress then
            stats:setStress(self.stats.stress)
        end
    end
end

function DrawInSketchbookAction:start()
    if isClient() and self.sketchbook then
        self.sketchbook = self.character:getInventory():getItemById(self.sketchbook:getID())
    end

    self:setAnimVariable("ReadType", "newspaper")
    self:setActionAnim(CharacterActionAnims.Read)
    self:setOverrideHandModels(nil, self.sketchbook)
    self.character:setReading(true)

    self.character:reportEvent("EventRead")

    self.stats = {}
    self.stats.boredom = self.character:getBodyDamage():getBoredomLevel()
    self.stats.unhappyness = self.character:getBodyDamage():getUnhappynessLevel()
    self.stats.stress = self.character:getStats():getBasicStress()

    self.character:playSound("OpenMagazine")
end

function DrawInSketchbookAction:stop()
    syncItemFields(self.character, self.sketchbook)

    self.character:playSound("CloseMagazine")

    ISBaseTimedAction.stop(self)
end

function DrawInSketchbookAction:serverStart()
    self.character:setReading(true)
    -- PF_Reading
    sendSyncPlayerFields(self.character, 0x00000010)
end

function DrawInSketchbookAction:serverStop()
    self.character:setReading(false)
    -- PF_Reading
    sendSyncPlayerFields(self.character, 0x00000010)
end

function DrawInSketchbookAction:perform()
    local objSprite = self.object:getSprite()
    local spriteProps = objSprite:getProperties()
    local entityName = spriteProps:Is("EntityScriptName") and spriteProps:Val("EntityScriptName")

    if entityName then
        local sketchbookModData = self.sketchbook:getModData()
        sketchbookModData["BuildersSketches"] = sketchbookModData["BuildersSketches"] or {}
        if not sketchbookModData["BuildersSketches"][entityName] then
            sketchbookModData["BuildersSketches"][entityName] = true
        end
    end

    self.character:playSound("CloseMagazine")
    ISBaseTimedAction.perform(self)
end

function DrawInSketchbookAction:complete()
    self.character:setReading(false)
    -- PF_Reading
    sendSyncPlayerFields(self.character, 0x00000010)
    return true
end

function DrawInSketchbookAction:animEvent(event, parameter)
    if event == "PageFlip" then
        if getGameSpeed() ~= 1 then return end
        self.character:playSound("PageFlipMagazine")
    end
end

function DrawInSketchbookAction:getDuration()
    if self.character:isTimedActionInstant() then return 1 end
    return 400 - (self.character:getPerkLevel(Perks.Woodwork) * 10)
end

function DrawInSketchbookAction:new(character, object, sketchbook)
    local o = ISBaseTimedAction.new(self, character)
    o.character = character
    o.object = object
    o.sketchbook = sketchbook
    o.ignoreHandsWounds = true
    o.maxTime = o:getDuration()
    return o
end
