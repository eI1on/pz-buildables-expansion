BuildablesExpansion = BuildablesExpansion or {};
BuildablesExpansion.RecipeCode = {};

BuildablesExpansion.RecipeCode.floorOverlay = {};
BuildablesExpansion.RecipeCode.doubleWindowGlass = {};
BuildablesExpansion.RecipeCode.stairs = {};
BuildablesExpansion.RecipeCode.garageDoors = {};


function BuildablesExpansion.RecipeCode.floorOverlay.OnIsValid(params)
    if params.square:getZ() > 0 then
        local below = getCell():getGridSquare(params.square:getX(), params.square:getY(), params.square:getZ() - 1);
        if below and below:HasStairs() then
            return false;
        end
    end

    local tileInfoSprite = params.tileInfo:getSpriteName();

    for i = 0, params.square:getObjects():size() - 1 do
        local object = params.square:getObjects():get(i); ---@type IsoObject
        local attachedAnimSprites = object:getAttachedAnimSprite();
        if attachedAnimSprites and attachedAnimSprites:size() > 0 then
            for i = 0, attachedAnimSprites:size() - 1 do
                local attachedAnimSprite = attachedAnimSprites:get(i); ---@type IsoSpriteInstance
                if attachedAnimSprite then
                    if (attachedAnimSprite:getName() and attachedAnimSprite:getName() == tileInfoSprite) then
                        return false;
                    end
                end
            end
        end
    end

    if not params.square:connectedWithFloor() then
        return false;
    end

    params.testCollisions = false; -- we have already tested this

    return true;
end

function BuildablesExpansion.RecipeCode.floorOverlay.OnCreate(thumpable)
    local square = thumpable:getSquare();
    local objects = square:getObjects();

    local spriteInstance = getSprite(thumpable:getSprite():getName()):newInstance();

    local rug = nil;
    local floorObject;
    for i = 0, objects:size() - 1 do
        local object = objects:get(i);
        if object and object ~= thumpable then
            local objProps = object:getProperties();

            if object:getTextureName() ~= nil and string.contains(object:getTextureName(), "floors_rugs") then
                rug = object;
            end

            if (objProps and objProps:Is(IsoFlagType.solidfloor) and not objProps:Is(IsoFlagType.taintedWater)) or object:isFloor() then
                local attachedAnimSprite = object:getAttachedAnimSprite();
                if not attachedAnimSprite then
                    attachedAnimSprite = ArrayList:new();
                    object:setAttachedAnimSprite(attachedAnimSprite);
                end
                attachedAnimSprite:add(spriteInstance);
                if isClient() then object:transmitUpdatedSpriteToServer(); end
                floorObject = object;
                break;
            end
        end
    end
    thumpable:getSquare():transmitRemoveItemFromSquare(thumpable);

    if rug ~= nil then
        -- ensure floor under rug
        local rugIndex = objects:indexOf(rug);
        local floorIndex = objects:indexOf(floorObject);
        if rugIndex < floorIndex then
            -- swap position
            objects:set(rugIndex, floorObject);
            objects:set(floorIndex, rug);
        end
    end

    square:EnsureSurroundNotNull();
    square:RecalcProperties();

    square:clearWater();
    square:disableErosion();
    local args = { x = square:getX(), y = square:getY(), z = square:getZ() };
    sendServerCommand('erosion', 'disableForSquare', args);

    invalidateLighting();
    square:setSquareChanged();
    floorObject:invalidateRenderChunkLevel(FBORenderChunk.DIRTY_OBJECT_ADD);
end

function BuildablesExpansion.RecipeCode.doubleWindowGlass.OnCreate(thumpable)
    local sprite = thumpable:getSprite():getName();

    local window = IsoWindow.new(getCell(), thumpable:getSquare(), thumpable:getSprite(), thumpable:getNorth());
    window:setIsLocked(false);
    thumpable:getSquare():AddSpecialObject(window);

    thumpable:getSquare():transmitRemoveItemFromSquare(thumpable);
end

function BuildablesExpansion.RecipeCode.stairs.OnIsValid(params)
    return true;
end

--- @param thumpable IsoThumpable
function BuildablesExpansion.RecipeCode.garageDoors.OnCreate(thumpable)
    local garageDoor = IsoDoor.new(getCell(), thumpable:getSquare(), thumpable:getSprite(), thumpable:getNorth());

    garageDoor:setName(thumpable:getName());
    garageDoor:setModData(copyTable(thumpable:getModData()));
    garageDoor:setKeyId(thumpable:getKeyId());
    garageDoor:setIsLocked(false);
    garageDoor:setLockedByKey(false);
    garageDoor:setHealth(thumpable:getHealth());

    thumpable:getSquare():AddSpecialObject(garageDoor);

    thumpable:getSquare():transmitRemoveItemFromSquare(thumpable);
end
