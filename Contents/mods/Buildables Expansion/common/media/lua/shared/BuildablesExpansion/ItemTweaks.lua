local Logger = require("BuildablesExpansion/Logger");

local function tweakItems()
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
    }

    for itemID, recipes in pairs(recipeMap) do
        local item = ScriptManager.instance:getItem(itemID);
        if item then
            local taughtRecipes = item:getTeachedRecipes();
            for i = 1, #recipes do
                taughtRecipes:add(recipes[i]);
            end
        end
    end
end

Events.OnInitGlobalModData.Add(tweakItems);
