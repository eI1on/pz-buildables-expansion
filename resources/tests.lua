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

        categorizedRecipes[category] = categorizedRecipes[category] ..
            string.format("%s = \"%s\",\n", name, translationName)
    end
end

print("DEBUG: Starting to categorize recipes. Total recipes: " .. recipes:size())
for category, recipeString in pairs(categorizedRecipes) do
    -- Count the number of recipes in the category
    local recipeCount = select(2, recipeString:gsub("\n", "\n"))
    print(string.format("Category: %s (%d recipes)", category, recipeCount))
    print(recipeString)
end




local FileUtils = require("ElyonLib/FileUtils/FileUtils");
local scripts = ScriptManager.instance:getAllGameEntities()
local infos = SpriteConfigManager.GetObjectInfoList()
local ENTITIES = {}

for i = 0, scripts:size() - 1 do
    local script = scripts:get(i)
    local selectedScriptCanBuild = script:getComponentScriptFor(ComponentType.SpriteConfig)
    local selectedCraftRecipe = script:getComponentScriptFor(ComponentType.CraftRecipe)

    if selectedScriptCanBuild then
        local objectInfo = false
        for j = 0, infos:size() - 1 do
            objectInfo = infos:get(j)
            if objectInfo:getScript() and objectInfo:getScript() == selectedScriptCanBuild then
                break
            end
            objectInfo = false
        end

        if objectInfo then
            local entityName = objectInfo:getName()

            local category = selectedCraftRecipe and selectedCraftRecipe:getCraftRecipe():getCategory() or
                "Uncategorized"

            if not ENTITIES[category] then
                ENTITIES[category] = {}
            end

            if not ENTITIES[category][entityName] then
                ENTITIES[category][entityName] = {}
            end

            -- Determine the expected facing of the object (first available)
            local expectedFacing = "W" -- Default
            if objectInfo:getFace("e") then
                expectedFacing = "E"
            elseif objectInfo:getFace("s") then
                expectedFacing = "S"
            elseif objectInfo:getFace("n") then
                expectedFacing = "N"
            elseif objectInfo:getFace("w") then
                expectedFacing = "W"
            end

            local face = objectInfo:getFace(expectedFacing:lower())
            if face then
                for zz = 0, face:getzLayers() - 1 do
                    for xx = 0, face:getWidth() - 1 do
                        for yy = 0, face:getHeight() - 1 do
                            local tileInfo = face:getTileInfo(xx, yy, zz)
                            if tileInfo and tileInfo:getSpriteName() then
                                table.insert(ENTITIES[category][entityName], tileInfo:getSpriteName())
                                local isoSprite = getSprite(tileInfo:getSpriteName())
                                local props = isoSprite:getProperties()

                                if props:Is("Facing") then
                                    local spriteFacing = props:Val("Facing") -- Facing can be W, E, S, N

                                    if spriteFacing ~= expectedFacing then
                                        print(string.format(
                                            "Warning: Sprite facing mismatch! Object: %s | Sprite: %s | Sprite Facing: %s | Expected Facing: %s",
                                            entityName, tileInfo:getSpriteName(), spriteFacing, expectedFacing))
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end


local fileName = "ISO_ENTITIES.json";
local cacheDir = Core.getMyDocumentFolder() ..
    getFileSeparator() .. "Lua" .. getFileSeparator() .. fileName;

local success = FileUtils.writeJson(fileName, ENTITIES, "ISO_ENTITIES", { createIfNull = true })









local FileUtils = require("ElyonLib/FileUtils/FileUtils");

local SketchDatabase = require("BuildablesExpansion/SketchDatabase").Sketches
local SketchDatabase_Processed_WithFacing = FileUtils.readJson("SketchDatabase_Processed_WithFacing.json", "ISO_ENTITIES",
    { isModFile = false })

local SketchDatabase_Merged = {}

for objectName, value in pairs(SketchDatabase) do
    if SketchDatabase_Processed_WithFacing[objectName] then
        SketchDatabase_Merged[objectName] = {
            category = SketchDatabase_Processed_WithFacing[objectName].category,
            texturesLayers = SketchDatabase_Processed_WithFacing[objectName].texturesLayers,
            direction = SketchDatabase_Processed_WithFacing[objectName].direction
        }
    else
        SketchDatabase_Merged[objectName] = value
    end
end

for objectName, value in pairs(SketchDatabase_Processed_WithFacing) do
    if not SketchDatabase[objectName] then
        SketchDatabase_Merged[objectName] = {
            category = value.category,
            texturesLayers = value.texturesLayers,
            direction = value.direction
        }
    end
end

local success = FileUtils.writeJson("SketchDatabase_Merged.json", SketchDatabase_Merged, "ISO_ENTITIES",
    { createIfNull = true })
if success then
    print("Successfully saved the merged database!")
else
    print("Failed to save the merged database.")
end







local SketchDatabase = require("BuildablesExpansion/SketchDatabase");
local BaseSketches = SketchDatabase.BaseSketches;
local Sketches = SketchDatabase.Sketches;

for entityName, entitySketchData in pairs(Sketches) do
    local categoryName = "";
    local texturesLayers = {};
    local entitySketch = entityName;
    if entitySketchData.baseSketch then
        if BaseSketches[entitySketchData.baseSketch] then
            entitySketch = entitySketchData.baseSketch;
            categoryName = BaseSketches[entitySketchData.baseSketch].category;
            texturesLayers = BaseSketches[entitySketchData.baseSketch].textures;
        else
            print("baseSketch not found for entityName=" .. entityName);
        end
    else
        categoryName = entitySketchData.category;
        texturesLayers = entitySketchData.textures;
    end

    if texturesLayers then
        for i = 1, #texturesLayers do
            for j = 1, #texturesLayers[i] do
                local texture = texturesLayers[i][j];
                local texturePath = ("media/ui/Sketches/" .. categoryName .. "/" .. entitySketch .. "/" .. texture)
                if not getTexture(texturePath) then
                    print("Texture not found for " .. texturePath);
                end
            end
        end
    else
        print("texturesLayers nil for " .. entityName)
    end
end















-- List of magazine item full types
local magazineTypes = {
    "MetalworkMag4", "MetalworkMag3", "MetalworkMag2", "MetalworkMag1",
    "MechanicMag3", "MechanicMag2", "MechanicMag1",
    "KnittingMag2", "KnittingMag1",
    "GlassmakingMag3", "GlassmakingMag2", "GlassmakingMag1",
    "EngineerMagazine2", "EngineerMagazine1",
    "ElectronicsMag5", "ElectronicsMag4", "ElectronicsMag3", "ElectronicsMag2", "ElectronicsMag1"
}

-- Collect locations for each magazine
local magazineLocations = {}

-- Function to find all locations for a specific item
local function findItemLocations(itemName)
    local locations = {}
    for distributionName, distributionData in pairs(ProceduralDistributions.list) do
        if distributionData.items then
            for i = 1, #distributionData.items, 2 do
                if distributionData.items[i] == itemName then
                    table.insert(locations, distributionName)
                end
            end
        end
    end
    return locations
end

-- Populate magazine locations
for _, magazine in ipairs(magazineTypes) do
    magazineLocations[magazine] = findItemLocations(magazine)
end

-- Find common locations across all magazines
local commonLocations = {}
local initialized = false

for _, locations in pairs(magazineLocations) do
    if not initialized then
        for _, location in ipairs(locations) do
            commonLocations[location] = true
        end
        initialized = true
    else
        local tempCommon = {}
        for _, location in ipairs(locations) do
            if commonLocations[location] then
                tempCommon[location] = true
            end
        end
        commonLocations = tempCommon
    end
end

-- Convert common locations to a list
local commonLocationList = {}
for location in pairs(commonLocations) do
    table.insert(commonLocationList, location)
end

-- Find unique locations for each magazine
local uniqueLocations = {}
for magazine, locations in pairs(magazineLocations) do
    uniqueLocations[magazine] = {}
    for _, location in ipairs(locations) do
        if not commonLocations[location] then
            table.insert(uniqueLocations[magazine], location)
        end
    end
end

print("=== Common Locations ===")
print(table.concat(commonLocationList, "\n"))

print("\n=== Unique Locations ===")
for magazine, locations in pairs(uniqueLocations) do
    if #locations > 0 then
        print(magazine .. ":")
        print("  " .. table.concat(locations, "\n  "))
    end
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

--[[

=== Common Locations ===
BookstoreMisc
CrateMagazines
LibraryMagazines
LivingRoomShelf
LivingRoomShelfClassy
LivingRoomShelfRedneck
LivingRoomSideTable
LivingRoomSideTableClassy
LivingRoomSideTableRedneck
LivingRoomWardrobe
MagazineRackMixed
PostOfficeMagazines
SafehouseBookShelf
ShelfGeneric
UniversityLibraryMagazines

=== Unique Locations ===

MetalworkMag1:
MetalWorkerOutfit
MetalWorkerTools
RecRoomShelf
SafehouseFireplace
SafehouseFireplace_Late
ToolStoreBooks

MechanicMag1:
BookstoreAutomotive
CarSupplyLiterature
CarSupplyMagazines
CarDealerDesk
CrateMechanics
GasStorageMechanics
MechanicOutfit
MechanicTools
MechanicShelfBooks
MechanicSpecial
NolansDesk
RecRoomShelf
SafehouseFireplace
SafehouseFireplace_Late
StoreShelfMechanics
ToolStoreBooks

KnittingMag1:
BookstoreFashion
Hobbies
Homesteading
KitchenBook
SafehouseFireplace
SafehouseFireplace_Late
SurvivalGear

EngineerMagazine1:
ArmyStorageElectronics
BedroomDresserChild
BedroomSidetableChild
BookstoreChilds
ElectronicStoreMagazines
EngineerTools
ElectricianOutfit
ElectricianTools
RecRoomShelf
SafehouseFireplace
SafehouseFireplace_Late
SchoolLockersBad
ToolStoreBooks
WardrobeChild

ElectronicsMag1:
ArmyStorageElectronics
BookstoreBlueCollar
ElectronicStoreMagazines
EngineerTools
ElectricianOutfit
ElectricianTools
RecRoomShelf
SafehouseFireplace
SafehouseFireplace_Late
ToolStoreBooks

]] --


local distrTable = {}
table.insert(distrTable, "\n")
local function findItemLocations(itemName)
    for distributionName, distributionData in pairs(ProceduralDistributions.list) do
        if distributionData.items then
            for i = 1, #distributionData.items, 2 do
                if distributionData.items[i] == itemName then
                    table.insert(distrTable,
                        string.format("\"%s\", %s,", distributionName, distributionData.items[i + 1]))
                end
            end
        end
    end
end

local itemFullType = "ElectronicsMag1"
print("=====================")
print(itemFullType)
findItemLocations(itemFullType)
print(table.concat(distrTable, " \n "))
print("=====================")


-- Example of the recipeMap structure
local recipeMap = {
    ["Base.MetalworkMag1"] = {
        -- Metal Floors
        "MetalBrownRailroadFloor", "MetalRustyMeshFloor", "MetalRustyMeshGrateFloor",
        "MetalGreenIndustrialFloor", "MetalElevatorFloor2", "MetalElevatorFloor1",
        "MetalGreyRailroadPanelFloor", "MetalSteelBarsFloor", "MetalGreyIndustrialFloor",
        -- Metal Stairs
        "ElevatorStairs", "ModernStairs", "BrownMetalStairs"
    },
    ["Base.MetalworkMag2"] = {
        -- Metal Containers
        "MedicalMetalCounter", "MilitaryLocker", "LargeMetalShelves", "StandingVault",
        "BlueWallLocker", "YellowWallLocker", "GreyFileCabinet", "WallBin", "WallVault",
        "WhiteFileCabinet",
        -- Metal Clothes Racks
        "SmallClothesRack", "ClothesStand", "LargeClothesRack",
        -- Trashcans
        "GreyGarbageBin", "SpiffosBin", "FossoilGarbageBin", "GreenGarbageBin", "WheelieBin",
        "PublicGarbageBin", "BlueDumpster", "MallGarbageBin", "OrangeDumpster", "RoundBin", "RecycleBin"
    },
    ["Base.MetalworkMag3"] = {
        -- Metal Wire Fences
        "WiredHighFenceCorner", "WiredHighFence",
        -- Metal Chainlink with Razor Wire Fences
        "ChainlinkAndRazorWireHighFence", "ChainlinkAndRazorWireHighFenceCorner",
        "ChainlinkAndRazorWireHighFencePost",
        "WiredRazorHighFence", "WiredRazorHighFenceCorner",
        -- Metal Wrought Fences
        "WroughtIronHighFence", "WroughtIronHighFenceCorner", "WroughtIronHighFencePost",
        "WroughtIronLowFence", "WroughtIronLowFenceCorner", "WroughtIronLowFencePost",
    },
    ["Base.FineWoodWorking_Furniture_BedsCouchesArmchairs"] = {
        -- Armchairs
        "Victorian3Armchair", "PurpleRattanArmchair", "Victorian1Armchair", "FancyWhiteArmchair",
        "WhiteModernArmchair", "Victorian4Armchair", "OrangeModernArmchair", "Victorian5Armchair",
        "YellowModernArmchair", "Victorian2Armchair", "RedModernArmchair", "WhiteLazyArmchair", "BlueComfyArmchair",
        "GreenComfyArmchair", "BlackFancyArmchair", "GreyLazyArmchair", "BlueRattanArmchair", "Victorian6Armchair",
        "BrownLazyArmchair",
        -- Restaurant seats
        "SpiffoLoungeSeat", "PizzaWhirledSeat", "BlueSeat", "50sSeat",
        -- Couches
        "Victorian6Couch", "Victorian3Couch", "Victorian1Couch", "BlueRattanCouch", "Victorian5Couch",
        "GreenComfyCouch", "BrownLazyCouch", "WhiteLazyCouch", "Victorian4Couch", "PurpleRattanCouch",
        "GreyLazyCouch", "OrangeModernCouch", "Victorian2Couch", "YellowModernCouch",
        -- Beds
        "HospitalBed", "TwinBed", "StretcherBed", "FancyBed", "SimpleBed", "BunkBed", "BlueBed",
        -- Large Beds
        "LargeFancyBed", "LargeOakBed", "LargeModernBed",
    },
    ["Base.FineWoodWorking_Furniture_ChairsBenches"] = {
        -- Chairs
        "DarkWoodenChair", "BlackOfficeChair", "GreenDinnerChair", "GreyChair", "BluePlasticChair", "WoodenChair",
        "FoldingChair", "RedWoodenChair", "WhiteWoodenChair",
        -- Benches
        "FancyOutdoorsBench", "BrickWallBench", "TrailerFixedBench", "SturdyBench", "ParkBench", "ChurchPew",
    },
    ["Base.FineWoodWorking_Furniture_Dressers"] = {
        -- Dressers
        "FancyDarkWardrobe", "LightWoodWardrobe", "FancyWhiteWardrobe", "LargeWardrobe", "FancyOakWardrobe",
        "SmallTableWithDrawer", "MirrorAndDrawers", "LightWoodWardrobe", "LightWoodDrawers", "LargeWardrobe",
        "FancyWhiteWardrobe", "FancyWhiteDrawers", "FancyOakWardrobe", "FancyOakDrawers", "FancyDarkWardrobe",
        "FancyDarkDrawers", "BedroomDrawers",
    },
    ["Base.FineWoodWorking_Furniture_Crates"] = {
        -- Others
        "SmallWoodenCrate", "VegetableBasket", "GreyMilitaryCrate", "BatteredCardboardBox",
        "GreenMilitaryCrate", "BigCardboardBox",
    },
    ["Base.FineWoodWorking_Furniture_Counters"] = {
        -- Commercial
        "FossoilCounter", "FossoilCounterCorner", "Gas2GoCounter", "Gas2GoCounterCorner", "GenericShopCounterCorner",
        "GenericShopCounter", "ShopDisplayCounter", "TrapezoidShopShelves", "GlassDisplayStand",
        "GlassDisplayCounterCorner", "GlassDisplayCounter", "GroceryDisplayCounter", "GroceryTrapezoidCounter",
        "LargeShopShelves", "RoundedGlassDisplayCounter", "WhiteDisplayCounter", "WhiteStrippedCounterCorner",
        "WhiteStrippedCounter", "WhiteStrippedDisplayStand",
        -- Restaurant
        "TheaterCounterCorner", "TheaterCounter", "DinerCounter", "BarBrownWallBar", "SquareTheaterCounter",
        "ZippeeCounterCorner", "SpiffosCounter", "BlackBarCounterCorner", "LeftBarBrownWallBar", "ZippeeCounter",
        "DinerCounterCorner", "BarBlackWallBar", "LeftBarBlackWallBar", "PizzaWhirledCounter", "OakBarCounterCorner",
        "PizzaWhirledCounterCorner", "RightBarBlackWallBar", "BlackBarCounter", "BrownBarCounterCorner",
        "BrownBarCounter", "RightBarBrownWallBar", "SeahorseCoffeeCounterCorner", "OakBarCounter",
        "SeahorseCoffeeCounter", "SpiffosCounterCorner",
        -- Residential
        "BirchwoodCounterCorner", "BirchwoodCounter", "BirchwoodFloatingCounter", "TrailerFloatingCounter",
        "TrailerCounter", "DarkCounterCorner", "DarkCounter", "GreenCounter", "GreenCounterCorner", "ModernCounter",
        "ModernCounterCorner", "MotelCounterCorner", "MotelCounter", "OakCounter", "OakCounterCorner", "WhiteCounter",
        "WhiteCounterCorner", "WoodenCounter", "WoodenCounterCorner",
    },
    ["Base.FineWoodWorking_Furniture_DesksTables"] = {
        -- Low Tables
        "BrownLowTable", "LongDarkLowTable", "FancyLowTable", "LongLightLowTable", "LightLowTable", "LongLowTable",
        "PlasticLowTable", "BlackModernLowTable",
        -- Large Tables
        "BleachedLargeTable", "LightRoundLargeTable", "SmoothPlasticLargeTable", "FancyLargeTable",
        "FancyDarkLargeTable", "SpiffoTypeBLargeTable", "BrownLargeTable", "DarkWoodenLargeTable",
        "OakRoundLargeTable", "LightOakLargeTable", "SmoothLargeTable", "DarkLargeTable",
        "LightWoodRestaurantLargeTable", "SpiffoTypeALargeTable", "OakLargeTable", "PlasticLargeTable",
        "BroadWhiteLargeTable", "SimpleLargeTable", "LongLowDoubleTable", "DarkOakLargeTable",
        -- Large Desks
        "BrownOfficeLargeDesk", "LightwoodLargeDesk", "OfficeLargeDesk",
    },
    ["Base.FineWoodWorking_DoorsWindows"] = {
        -- Windows
        "ArchedWhiteWoodenWindow", "Trailer2Window", "Trailer1Window",
        "WhiteWindow", "WhiteTiledWindow", "TiledWindow", "SliderWindow", "ChromeWindow",
        -- Wooden Doors
        "WhitePanelDoor", "WhiteDoor", "TanDoor", "RoughWoodenDoor", "DoublePaneBlackDoor", "WoodenDoor",
        "CherryDoor", "BrownPanelDoor", "BrownDoor", "BlueDoor", "BlackPanelDoor", "BlackDoor",
        -- Wooden Doors with Windows
        "WhiteGlassSlidingDoor", "BrownGlassSlidingDoor", "SinglePaneChestnutDoor", "SinglePaneBlackDoor",
        "WhiteWindowDoor", "BrownWindowDoor", "FossoilBlueWindowDoor", "SpiffoOrangeWindowDoor",
        "SeaHorseBrownWindowDoor", "PizzaWhirledBrownWindowDoor", "PileOCrepeBlueWindowDoor", "Gas2GoRedWindowDoor",
    },
    ["Base.TheFamilyHandyman_StairsFences"] = {
        -- Wooden Stairs
        "DarkBrownWoodenStairs", "YellowBrownWoodenStairs", "WhiteIndustrialWoodenStairs",
        "SimpleWoodenStairs", "WhiteMotelWoodenStairs", "BrownWoodenStairs",
        -- Wooden High Fences
        "WoodenDecorativeHighFencePost", "WoodenHighFenceCorner", "WoodenHighFencePost",
        "WoodenDecorativeHighFence", "WoodenHighFence",
        -- Wooden Low Fences
        "LowWoodenWhiteRailingPost", "LowWoodenWhiteRailingTallPost", "LowWoodenRailingPost",
        "LowWoodenGreyFenceCorner", "LowWoodenRailingTallPost", "LowWoodenRailing",
        "LowWoodenWhiteRailingCornerTallPost", "LowWoodenWhitePicketFence", "LowWoodenRailingCorner",
        "LowWoodenWhitePicketFenceCorner", "LowWoodenGreyFence", "LowWoodenGreyFencePost",
        "LowWoodenRailingCornerTallPost", "HescoBarrier", "LowWoodenWhiteRailing",
        "LowWoodenWhitePicketFencePost", "LowWoodenWhiteRailingCorner"
    },
    ["Base.OldHouseJournal_WoodenFloors"] = {
        -- Wooden Floors
        "WoodFloorWidePlank", "WoodFloorCinnamon", "WoodFloorPinewood",
        "WoodFloorFinewood", "WoodFloorOakwood", "WoodFloorChestnut",
        "WoodFloorHardwood", "WoodFloorBirchwood"
    },
    ["Base.ArchitecturalDigest_RugsCarpets"] = {
        -- Carpets
        "FloorGreyCarpet", "FloorYellowCarpet", "FloorBlueCarpet", "FloorDarkRedCarpet",
        "FloorDarkGreyCarpet", "FloorLightGreenCarpet", "FloorBrownCarpet", "FloorRedCarpet",
        "FloorGreenCarpet", "FloorBeigeCarpet", "FloorPurpleCarpet", "FloorWhiteCarpet",
        "FloorGreenesGroceryCarpet", "FloorBlackCarpet", "FloorBordeauxCarpet", "FloorGreyCurlyCarpet",
        "FloorVioletCarpet",
        -- Rugs
        "FancyOrangeRugCorner", "BordeauxSideRug", "BathroomBrownRug",
        "DarkGreySideRug", "FancyBrownRug", "DarkGreenRugCorner", "DarkGreyRug", "DarkGreenRug",
        "DarkGreenSideRug", "BathroomPurpleRug", "BordeauxRug", "BordeauxVictorian2Rug", "FancyBlueRug",
        "DarkPurpleVictorian1Rug", "DoorMat", "DarkGreenVictorian1Rug", "DarkPurpleSideRug",
        "DarkPurpleRug", "DarkPurpleRugCorner", "BordeauxVictorian1Rug", "FancyGreenRugCorner",
        "BordeauxRugCorner", "FancyOrangeRug", "FancyBlueRugCorner", "FancyGreenRug",
        "FancyBrownRugCorner", "DarkGreenVictorian2Rug", "DarkPurpleVictorian2Rug"
    },
    ["Base.HomeMechanix_Bathroom"] = {
        -- Toilets
        "HangingToilet", "FancyToilet", "LowToilet",
        -- Sinks
        "ChromeSink", "BeigeSink", "DarkIndustrialSink", "WhiteSink", "IndustrialSink", "WhiteStandingSink",
        "WhiteHangingSink",
        -- Showers
        "DeluxeShower", "LargeDeluxeBath"
    },
    ["Base.ProjectsInMetal_Diverse"] = {
        -- Garage
        "CarLiftPillar", "CarLiftUpperMiddlePart", "CarLiftLowerPart", "CarLiftMiddleMiddlePart",
        -- Metal Doors
        "WhiteMetalDoor", "TanMetalDoor", "SpiffosRedMetalDoor", "SecurityDoor", "RedMetalDoor",
        "PizzaWhirledGreenMetalDoor", "PileOCrepeOrangeMetalDoor", "MetalDoor", "BlueMetalDoor", "BlackMetalDoor",
        "DoubleMetalGreyRightDoor", "DoubleMetalGreyLeftDoor",
        -- Metal Doors with Windows
        "DoubleMetalOrangeKitchenGlassRightDoor", "DoubleMetalOrangeKitchenGlassLeftDoor",
        "DoubleMetalBlackGlassRightDoor", "DoubleMetalBlackGlassLeftDoor", "WhiteWindowMetalDoor",
        -- Metal Gates
        "DoubleWroughtIronGate",
        -- Garage Doors
        "3TileWhiteGarageDoor", "3TileRollingGarageDoor", "3TileGreenGarageDoor", "3TileGreenGarageDoor",
        -- Garage Doors with Windows
        "3TileRollingWindowGarageDoor", "3TileRedWindowGarageDoor",
    },
    ["Base.PopularMechanics_Lighting"] = {
        -- Light Lamps
        "RoundOutdoorLamp", "FancyOutdoorLamp", "OvalOutdoorLamp", "AntiqueOutdoorLamp", "ModernOutdoorLamp",
        "NeonOpenSign",
        -- Light Poles
        "FloodLights", "TallLightPost", "FancyGreyLightPost", "FancyLightPost", "OvalLightPost",
        -- Lightswitches
        "LightSwitchLeftSide", "LightSwitchRightSide",
    },
    ["Base.PopularMechanics_HomeAppliances"] = {
        -- Cooking appliances
        "WhiteMicrowave", "GreenOven", "JorgeForeguyBarbecue", "GreyOven", "ChromeMicrowave", "Barbecue",
        "IndustrialOven", "FryersClubIndustrial", "RedOven", "AntiqueOven", "ModernOven",
        -- Fridges
        "MiniFridge", "RedFridge", "TrailerFridgeA", "TrailerFridgeB", "PlainFridge", "WhiteFridge",
        "GreenFridge", "PopsicleFridge", "BlueFridge", "WhiteIndustrialFridge", "IndustrialFridge",
        "SteelFridge", "GenericCooledShelves", "LargeFridge",
        -- Washing machines
        "WhiteWashingMachine", "BlueComboWasherDryer", "WhiteClothingDryer"
    },
    ["Base.FlooringGuide_Ceramic"] = {
        -- Ceramic Tile Floors
        "CeramicFloorBlackTiles", "CeramicFloorWhiteDiagonalTiles", "CeramicFloorYellowCheckeredTiles",
        "CeramicFloorGreyTiles", "CeramicFloorBrownCheckeredTiles", "CeramicFloorBrownTiles",
        "CeramicFloorGreyDiagonalTiles", "CeramicFloorDarkGreyTiles", "CeramicFloorBlueCheckeredTiles",
        "CeramicFloorDarkGreySquaresTiles", "CeramicFloorGreenTiles", "CeramicFloorCinnamonTiles",
        "CeramicFloorBeigeCheckeredTiles", "CeramicFloorBlackDiagonalTiles", "CeramicFloorPurpleTiles",
        "CeramicFloorGreenDiagonalTiles", "CeramicFloorGreyCheckeredTiles", "CeramicFloorWhiteCheckeredTiles",
        "CeramicFloorGreySquaresTiles", "CeramicFloorHardwoodTiles", "CeramicFloorBirchwoodTiles",
        "CeramicFloorBrownDiagonalTiles", "CeramicFloorYellowDiagonalTiles", "CeramicFloorAcaciaTiles"
    },
    ["Base.FlooringGuide_Paved"] = {
        -- Asphalt Floors
        "BeigeAsphaltFloor", "MediumAsphaltEdgeFloor", "LightAsphaltCornerFloor", "DarkAsphaltCornerFloor",
        "OldAsphaltCornerFloor", "DarkAsphaltFloor", "MediumAsphaltCornerFloor", "LightAsphaltFloor",
        "BeigeAsphaltCornerFloor", "OldAsphaltFloor", "DarkAsphaltEdgeFloor", "MediumAsphaltFloor",
        "LightAsphaltEdgeFloor", "OldAsphaltEdgeFloor",
        -- Concrete Floors
        "ConcreteFloor", "ConcreteCornerFloor",
        -- Smooth Floors
        "GreySmoothTilesFloor", "WhiteSmoothTilesFloor", "BeigeSmoothTilesFloor", "DarkGreySmoothTilesFloor"
    },
    ["Base.DecorationsGuide_RoadwayGarage"] = {
        -- Concrete
        "ConcreteRoadBlock", "ConcreteWheelStop",
        -- Others
        "RoadConeBig", "PostBarrier", "Standpipe", "RoadBlock", "RoadConeSmall",
        "MailBox", "PublicMailBox",
    },
};

local function buildSketchDatabase(recipeMap)
    local database = {};

    for magazineName, items in pairs(recipeMap) do
        for _, objectName in ipairs(items) do
            table.insert(database, { [objectName] = true })
        end
    end

    return database;
end

local function formatSketchDatabase(database)
    local formattedOutput = "local sketchDatabase = {\n"

    for _, entry in ipairs(database) do
        for k, v in entry do
            formattedOutput = formattedOutput .. string.format("    [\"%s\"] = true,\n", k)
        end
    end

    formattedOutput = formattedOutput .. "}\n\nreturn sketchDatabase"
    return formattedOutput
end

-- Build and format the database
local sketchDatabase = buildSketchDatabase(recipeMap)
local formattedDatabase = formatSketchDatabase(sketchDatabase)

-- Print the formatted database (copy this to your Lua file)
print(formattedDatabase)
