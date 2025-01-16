local logic = BuildLogic.new(getPlayer(), nil, nil)
local recipes = logic:getAllBuildableRecipes()

local categorizedRecipes = {}

for i = 0, recipes:size() - 1 do
    local recipe = recipes:get(i)
    local category = recipe:getCategory()
    local name = recipe:getName()
    local translationName = recipe:getTranslationName()

    if not translationName:find("TEST") then
        if not categorizedRecipes[category] then
            categorizedRecipes[category] = ""
        end

        categorizedRecipes[category] = categorizedRecipes[category] .. string.format("%s = \"%s\",\n", name, translationName)
    end
end

print("DEBUG: Starting to categorize recipes. Total recipes: " .. recipes:size())
for category, recipeString in pairs(categorizedRecipes) do
    -- Count the number of recipes in the category
    local recipeCount = select(2, recipeString:gsub("\n", "\n"))
    print(string.format("Category: %s (%d recipes)", category, recipeCount))
    print(recipeString)
end




local itemsToAdd = {
    "Base.FineWoodWorking_Furniture_BedsCouchesArmchairs",
    "Base.FineWoodWorking_Furniture_ChairsBenches",
    "Base.FineWoodWorking_Furniture_Dressers",
    "Base.FineWoodWorking_Furniture_Crates",
    "Base.FineWoodWorking_Furniture_Counters",
    "Base.FineWoodWorking_Furniture_DesksTables",
    "Base.FineWoodWorking_DoorsWindows",
    "Base.TheFamilyHandyman_StairsFences",
    "Base.OldHouseJournal_WoodenFloors",
    "Base.ArchitecturalDigest_RugsCarpets",
    "Base.HomeMechanix_Bathroom",
    "Base.ProjectsInMetal_Diverse",
    "Base.PopularMechanics_Lighting",
    "Base.PopularMechanics_HomeAppliances",
    "Base.FlooringGuide_Ceramic",
    "Base.FlooringGuide_Paved",
    "Base.DecorationsGuide_RoadwayGarage"
}

local playerInventory = getPlayer():getInventory()

for _, item in ipairs(itemsToAdd) do
    playerInventory:AddItem(item)
end
