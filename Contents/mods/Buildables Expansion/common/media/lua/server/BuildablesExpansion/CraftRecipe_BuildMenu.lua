---@class BuildablesExpansion
BuildablesExpansion = BuildablesExpansion or {};
BuildablesExpansion.BuildMenu = {};


--- Checks if the player has any of the required skills for the given recipe.
--- @param player IsoPlayer The player character to check skills for.
--- @param recipe CraftRecipe The recipe to check required skills for.
--- @return boolean true if the player has any required skill at or above the required level, false otherwise.
local function hasRequiredSkill(player, recipe)
    local requiredSkillCount = recipe:getRequiredSkillCount();
    if requiredSkillCount > 0 then
        for i = 0, requiredSkillCount - 1 do
            local requiredSkill = recipe:getRequiredSkill(i);
            local requiredPerkLevel = requiredSkill and requiredSkill:getLevel() or 0;
            local requiredPerk = requiredSkill and requiredSkill:getPerk() or nil;
            if requiredPerk and requiredPerkLevel > 0 then
                local playerPerkLevel = player:getPerkLevel(requiredPerk);
                return playerPerkLevel >= requiredPerkLevel;
            end
        end
        return false;
    else
        return true;
    end
end


--- @class CraftingParam
--- @field shouldShowAll boolean If true, bypass skill checks and always return true
--- @field player IsoPlayer The player character performing the crafting
--- @field recipe CraftRecipe The recipe being checked

--- Checks if the player can build the entity based on required skills
--- @param param CraftingParam A table containing parameters for the crafting check
--- @return boolean true if the player can craft the item, false otherwise
function genericOnAddToMenu(param)
    if param.shouldShowAll then return true; end
    return hasRequiredSkill(param.player, param.recipe);
end
