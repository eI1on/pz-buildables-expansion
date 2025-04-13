---@class BuildablesExpansion
BuildablesExpansion = BuildablesExpansion or {}
BuildablesExpansion.BuildMenu = {}

--- Check if the player meets any required skill for a recipe
--- @param player IsoPlayer
--- @param recipe CraftRecipe
--- @return boolean
local function hasRequiredSkill(player, recipe)
    local count = recipe:getRequiredSkillCount()
    if count == 0 then return true end

    for i = 0, count - 1 do
        local skill = recipe:getRequiredSkill(i)
        if skill then
            local perk = skill:getPerk()
            local level = skill:getLevel()
            if perk and player:getPerkLevel(perk) >= level then
                return true
            end
        end
    end

    return false
end

--- Check if the player has the sketch in any sketchbook
--- @param player IsoPlayer
--- @param recipeName string
--- @return boolean
local function hasSketch(player, recipeName)
    local sketchbooks = player:getInventory():FindAll("BuildersSketchbook")
    if not sketchbooks then return false end

    for i = 0, sketchbooks:size() - 1 do
        local modData = sketchbooks:get(i):getModData()["BuildersSketches"] or {}
        if modData[recipeName] then
            return true
        end
    end

    return false
end

--- @class CraftingParam
--- @field shouldShowAll boolean Bypass unlock checks if true
--- @field player IsoPlayer
--- @field recipe CraftRecipe

--- Determines if a recipe should be shown in the build menu
--- @param param CraftingParam
--- @return boolean
function genericOnAddToMenu(param)
    local settings = SandboxVars.BuildablesExpansion
    local recipe = param.recipe
    local recipeName = recipe:getName()
    local player = param.player

    if not settings or not settings.unlockingMethod then
        return hasRequiredSkill(player, recipe)
    end

    local unlockMode = settings.unlockingMethod

    local recipeKnown = not recipe:needToBeLearn() or player:isRecipeKnown(recipeName)
    local sketchKnown = hasSketch(player, recipeName)

    if unlockMode == 1 then
        -- Known via magazine OR sketchbook
        return (recipeKnown or sketchKnown) and (hasRequiredSkill(player, recipe) or param.shouldShowAll)
    elseif unlockMode == 2 then
        -- Magazine only
        return recipeKnown and (hasRequiredSkill(player, recipe) or param.shouldShowAll)
    elseif unlockMode == 3 then
        -- Sketchbook only
        return sketchKnown and (hasRequiredSkill(player, recipe) or param.shouldShowAll)
    end

    return hasRequiredSkill(player, recipe)
end
