local Chapters = {
    ["Appliances"] = {
        ["Appliances_Bathroom"] = true,
        ["Appliances_Cooking"] = true,
        ["Appliances_Fridges"] = true,
        ["Appliances_Laundry"] = true,
    },
    ["Containers"] = {
        ["Containers_Bookshelves"] = true,
        ["Containers_Commercial"] = true,
        ["Containers_Crates"] = true,
        ["Containers_Metal"] = true,
        ["Containers_Residential"] = true,
        ["Containers_Trashcans"] = true,
    },
    ["Decorations"] = {
        ["Decorations_Garage"] = true,
        ["Decorations_Rugs"] = true,
        ["Decorations_Roadway"] = true
    },
    ["Doors"] = {
        ["Doors_Garage"] = true,
        ["Doors_Metal"] = true,
        ["Doors_Wooden"] = true,
    },
    ["Fences"] = {
        ["Fences_High"] = true,
        ["Fences_Low"] = true,
    },
    ["Floors"] = {
        ["Floors_Carpets"] = true,
        ["Floors_Ceramic"] = true,
        ["Floors_Concrete"] = true,
        ["Floors_Metal"] = true,
        ["Floors_Natural"] = true,
        ["Floors_Paved"] = true,
        ["Floors_Wooden"] = true,
    },
    ["Furniture"] = {
        ["Furniture_Beds"] = true,
        ["Furniture_Dressers"] = true,
        ["Furniture_Seating"] = true,
        ["Furniture_Tables"] = true,
    },
    ["Lighting"] = {
        ["Lighting"] = true,
    },
    ["Masonry"] = {
        ["Masonry"] = true,
    },
    ["Stairs"] = {
        ["Stairs_Metal"] = true,
        ["Stairs_Wood"] = true,
    },
    ["Welding"] = {
        ["Welding"] = true,
    },
    ["Windows"] = {
        ["Windows"] = true,
    },
    ["Other"] = {
        ["Other"] = true,
    },
}

local BaseSketches = {
    ["BS_PlainFridge"] = {
        ["category"] = "Appliances_Fridges",
        ["textures"] = {
            { "appliances_refrigeration_01_29_sketch.png" }
        },
    },


    ["BS_GenericShopCounter"] = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_shop_generic_01_19_sketch.png" }
        },
    },
    ["BS_GenericShopCounterCorner"] = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_shop_generic_01_18_sketch.png" }
        },
    },


    ["BS_GenericResidentialCounter"] = {
        ["category"] = "Containers_Residential",
        ["textures"] = {
            { "fixtures_counters_01_75_sketch.png" }
        },
    },
    ["BS_GenericResidentialCounterCorner"] = {
        ["category"] = "Containers_Residential",
        ["textures"] = {
            { "fixtures_counters_01_74_sketch.png" }
        },
    },


    ["BS_TrailerFloatingCounter"] = {
        ["category"] = "Containers_Residential",
        ["textures"] = {
            { "location_trailer_02_23_sketch.png" }
        },
    },


    ["BS_GenericDisplayStand"] = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_pie_01_53_sketch.png" }
        },
    },
    ["BS_TrapezoidShopShelves"] = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_shop_greenes_01_29_sketch.png" }
        },
    },


    ["BS_MilitaryCrate"] = {
        ["category"] = "Containers_Crates",
        ["textures"] = {
            { "buildables_expansion_01_8_sketch.png" }
        },
    },


    ["BS_WallLocker"] = {
        ["category"] = "Containers_Metal",
        ["textures"] = {
            { "furniture_storage_02_12_sketch.png" }
        },
    },


    ["BS_GarbageBin"] = {
        ["category"] = "Containers_Trashcans",
        ["textures"] = {
            { "location_shop_fossoil_01_33_sketch.png" }
        },
    },
    ["BS_BigDumpster"] = {
        ["category"] = "Containers_Trashcans",
        ["textures"] = {
            { "trashcontainers_01_9_sketch.png" },
            { "trashcontainers_01_8_sketch.png" }
        },
    },


    ["BS_FloorRug"] = {
        ["category"] = "Decorations_Rugs",
        ["textures"] = {
            { "floors_rugs_01_62_sketch.png" }
        },
    },
    ["BS_FloorRugCorner"] = {
        ["category"] = "Decorations_Rugs",
        ["textures"] = {
            { "floors_rugs_01_23_sketch.png" }
        },
    },
    ["BS_FloorRugInnerCorner"] = {
        ["category"] = "Decorations_Rugs",
        ["textures"] = {
            { "floors_rugs_01_96_sketch.png" }
        },
    },
    ["BS_FloorRugSide"] = {
        ["category"] = "Decorations_Rugs",
        ["textures"] = {
            { "floors_rugs_01_18_sketch.png" }
        },
    },


    ["BS_FloorCarpet"] = {
        ["category"] = "Floors_Carpets",
        ["textures"] = {
            { "floors_interior_carpet_01_11_sketch.png" }
        },
    },


    ["BS_SimpleMetalDoor"] = {
        ["category"] = "Doors_Metal",
        ["textures"] = {
            { "fixtures_doors_01_57_sketch.png" }
        },
    },
    ["BS_MetalDoor"] = {
        ["category"] = "Doors_Metal",
        ["textures"] = {
            { "location_restaurant_pizzawhirled_01_61_sketch.png" }
        },
    },


    ["BS_PanelDoor"] = {
        ["category"] = "Doors_Wooden",
        ["textures"] = {
            { "fixtures_doors_02_21_sketch.png" }
        },
    },
    ["BS_SimpleWoodenDoor"] = {
        ["category"] = "Doors_Wooden",
        ["textures"] = {
            { "fixtures_doors_01_29_sketch.png" }
        },
    },
    ["BS_WoodenDoor"] = {
        ["category"] = "Doors_Wooden",
        ["textures"] = {
            { "fixtures_doors_01_1_sketch.png" }
        },
    },
    ["BS_SingleGlassPanelDoor"] = {
        ["category"] = "Doors_Wooden",
        ["textures"] = {
            { "fixtures_doors_01_45_sketch.png" }
        },
    },
    ["BS_SmallSingleGlassPanelDoor"] = {
        ["category"] = "Doors_Wooden",
        ["textures"] = {
            { "fixtures_doors_01_17_sketch.png" }
        },
    },
    ["BS_BigSingleGlassPanelDoor"] = {
        ["category"] = "Doors_Wooden",
        ["textures"] = {
            { "fixtures_doors_01_37_sketch.png" }
        },
    },
    ["BS_DoubleGlassPanelDoor"] = {
        ["category"] = "Doors_Wooden",
        ["textures"] = {
            { "location_restaurant_spiffos_01_49_sketch.png" }
        },
    },
    ["BS_GlassSlidingDoor"] = {
        ["category"] = "Doors_Wooden",
        ["textures"] = {
            { "fixtures_doors_01_117_sketch.png" }
        },
    },


    ["BS_FloorCeramicDiagonal"] = {
        ["category"] = "Floors_Ceramic",
        ["textures"] = {
            { "floors_interior_tilesandwood_01_1_sketch.png" }
        },
    },
    ["BS_FloorCeramicCheckered"] = {
        ["category"] = "Floors_Ceramic",
        ["textures"] = {
            { "floors_interior_tilesandwood_01_5_sketch.png" }
        },
    },
    ["BS_FloorCeramicBigSquares"] = {
        ["category"] = "Floors_Ceramic",
        ["textures"] = {
            { "floors_interior_tilesandwood_01_7_sketch.png" }
        },
    },


    ["BS_FloorSmoothConcrete"] = {
        ["category"] = "Floors_Concrete",
        ["textures"] = {
            { "floors_interior_tilesandwood_01_16_sketch.png" }
        },
    },


    ["BS_FloorRailroadPanel"] = {
        ["category"] = "Floors_Metal",
        ["textures"] = {
            { "industry_railroad_05_23_sketch.png" }
        },
    },
    ["BS_FloorRustyMesh"] = {
        ["category"] = "Floors_Metal",
        ["textures"] = {
            { "industry_01_38_sketch.png" }
        },
    },

    ["BS_FloorAsphalt"] = {
        ["category"] = "Floors_Paved",
        ["textures"] = {
            { "blends_street_01_5_sketch.png" }
        },
    },
    ["BS_FloorAsphaltCorner"] = {
        ["category"] = "Floors_Paved",
        ["textures"] = {
            { "blends_street_01_4_sketch.png" }
        },
    },
    ["BS_FloorAsphaltEdge"] = {
        ["category"] = "Floors_Paved",
        ["textures"] = {
            { "blends_street_01_10_sketch.png" }
        },
    },


    ["BS_FloorSimpleWooden"] = {
        ["category"] = "Floors_Wooden",
        ["textures"] = {
            { "floors_interior_tilesandwood_01_42_sketch.png" }
        },
    },

    ["BS_SimpleDrawers"] = {
        ["category"] = "Furniture_Dressers",
        ["textures"] = {
            { "furniture_storage_01_8_sketch.png" }
        },
    },
    ["BS_LargeWardrobe"] = {
        ["category"] = "Furniture_Dressers",
        ["textures"] = {
            { "furniture_storage_01_1_sketch.png" },
            { "furniture_storage_01_0_sketch.png" }
        },
    },


    ["BS_FancyArmchair"] = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_01_36_sketch.png" }
        },
    },
    ["BS_ArmchairVictorianA"] = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_03_80_sketch.png" }
        },
    },
    ["BS_ArmchairVictorianB"] = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_03_124_sketch.png" }
        },
    },
    ["BS_ArmchairModern"] = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_01_44_sketch.png" }
        },
    },
    ["BS_ArmchairComfy"] = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_03_24_sketch.png" }
        },
    },
    ["BS_ArmchairLazy"] = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_02_21_sketch.png" }
        },
    },
    ["BS_ArmchairRattan"] = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_02_40_sketch.png" }
        },
    },


    ["BS_RestaurantLoungeSeat"] = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "location_restaurant_spiffos_02_17_sketch.png" },
            { "location_restaurant_spiffos_02_16_sketch.png" }
        },
    },

    ["BS_CouchVictorianA"] = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_03_73_sketch.png" },
            { "furniture_seating_indoor_03_72_sketch.png" }
        },
    },
    ["BS_CouchVictorianB"] = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_03_137_sketch.png" },
            { "furniture_seating_indoor_03_136_sketch.png" }
        },
    },
    ["BS_CouchModern"] = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_03_19_sketch.png" },
            { "furniture_seating_indoor_03_18_sketch.png" }
        },
    },
    ["BS_CouchComfy"] = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_01_19_sketch.png" },
            { "furniture_seating_indoor_01_18_sketch.png" }
        },
    },
    ["BS_CouchLazy"] = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_02_27_sketch.png" },
            { "furniture_seating_indoor_02_26_sketch.png" }
        },
    },
    ["BS_CouchRattan"] = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_02_33_sketch.png" },
            { "furniture_seating_indoor_02_32_sketch.png" }
        },
    },


    ["BS_LargeWoodenTable"] = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "furniture_tables_high_01_39_sketch.png" },
            { "furniture_tables_high_01_38_sketch.png" }
        },
    },
    ["BS_LargeRoundWoodenTable"] = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "furniture_tables_high_01_7_sketch.png" }
        },
    },
    ["BS_FancyLargeTable"] = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "furniture_tables_high_01_15_sketch.png" }
        },
    },
    ["BS_SpiffoLargeTable"] = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "location_restaurant_spiffos_02_32_sketch.png", "location_restaurant_spiffos_02_33_sketch.png" }
        },
    },
    ["BS_SmoothLargeTable"] = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "furniture_tables_high_01_49_sketch.png" },
            { "furniture_tables_high_01_48_sketch.png" }
        },
    },
    ["BS_LargeOfficeDesk"] = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "location_business_office_generic_01_41_sketch.png" },
            { "location_business_office_generic_01_40_sketch.png" }
        },
    },
    ["BS_LongLowTable"] = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "furniture_tables_high_01_12_sketch.png" }
        },
    },

    ["BS_WoodenStairs"] = {
        ["category"] = "Stairs_Wood",
        ["textures"] = {
            {
                "location_hospitality_sunstarmotel_01_42_sketch.png",
                "location_hospitality_sunstarmotel_01_41_sketch.png",
                "location_hospitality_sunstarmotel_01_40_sketch.png"
            }
        },
    },

    ["BS_SimpleWindow"] = {
        ["category"] = "Windows",
        ["textures"] = {
            { "fixtures_windows_01_25_sketch.png" }
        },
    },
    ["BS_TiledWindow"] = {
        ["category"] = "Windows",
        ["textures"] = {
            { "fixtures_windows_01_9_sketch.png" }
        },
    },
    ["BS_TrailerDoubleWindow"] = {
        ["category"] = "Windows",
        ["textures"] = {
            { "fixtures_windows_01_50_sketch.png", "fixtures_windows_01_51_sketch.png" }
        },
    },
}

local Sketches = {
    --Fileplaces
    ["Fireplace"]       = {
        ["category"] = "Masonry",
        ["textures"] = {
            { "fixtures_fireplaces_01_5_sketch.png" }
        },
    },
    ["FireplaceDouble"] = {
        ["category"] = "Masonry",
        ["textures"] = {
            { "fixtures_fireplaces_01_4_sketch.png" },
            { "fixtures_fireplaces_01_3_sketch.png" },
        },
    },


    -- Outdoor Lamps
    ["RoundOutdoorLamp"]     = {
        ["category"] = "Lighting",
        ["textures"] = {
            { "lighting_outdoor_01_25_sketch.png" }
        },
    },
    ["FancyOutdoorLamp"]     = {
        ["category"] = "Lighting",
        ["textures"] = {
            { "lighting_outdoor_01_35_sketch.png" }
        },
    },
    ["OvalOutdoorLamp"]      = {
        ["category"] = "Lighting",
        ["textures"] = {
            { "lighting_outdoor_01_41_sketch.png" }
        },
    },
    ["AntiqueOutdoorLamp"]   = {
        ["category"] = "Lighting",
        ["textures"] = {
            { "lighting_outdoor_01_27_sketch.png" }
        },
    },
    ["ModernOutdoorLamp"]    = {
        ["category"] = "Lighting",
        ["textures"] = {
            { "lighting_outdoor_01_33_sketch.png" }
        },
    },

    -- Neon Signs
    ["NeonOpenSign"]         = {
        ["category"] = "Lighting",
        ["textures"] = {
            { "lighting_outdoor_01_43_sketch.png" }
        },
    },

    -- Light Poles
    ["FloodLights"]          = {
        ["category"] = "Lighting",
        ["textures"] = {
            { "buildables_expansion_lighting_4_sketch.png" }
        },
    },
    ["TallLightPost"]        = {
        ["category"] = "Lighting",
        ["textures"] = {
            { "buildables_expansion_lighting_9_sketch.png" }
        },
    },
    ["FancyGreyLightPost"]   = {
        ["category"] = "Lighting",
        ["textures"] = {
            { "buildables_expansion_lighting_2_sketch.png" }
        },
    },
    ["FancyLightPost"]       = {
        ["category"] = "Lighting",
        ["textures"] = {
            { "buildables_expansion_lighting_0_sketch.png" }
        },
    },
    ["OvalLightPost"]        = {
        ["category"] = "Lighting",
        ["textures"] = {
            { "buildables_expansion_lighting_1_sketch.png" }
        },
    },

    -- Lightswitches
    ["LightSwitchRightSide"] = {
        ["category"] = "Lighting",
        ["textures"] = {
            { "buildables_expansion_lighting_29_sketch.png" }
        },
    },
    ["LightSwitchLeftSide"]  = {
        ["category"] = "Lighting",
        ["textures"] = {
            { "buildables_expansion_lighting_25_sketch.png" }
        },
    },

    -- Cooking appliances
    ["GreenOven"]            = {
        ["category"] = "Appliances_Cooking",
        ["textures"] = {
            { "appliances_cooking_01_0_sketch.png" }
        },
    },
    ["JorgeForeguyBarbecue"] = {
        ["category"] = "Appliances_Cooking",
        ["textures"] = {
            { "appliances_cooking_01_45_sketch.png" }
        },
    },
    ["GreyOven"]             = {
        ["category"] = "Appliances_Cooking",
        ["textures"] = {
            { "appliances_cooking_01_4_sketch.png" }
        },
    },
    ["Barbecue"]             = {
        ["category"] = "Appliances_Cooking",
        ["textures"] = {
            { "appliances_cooking_01_35_sketch.png" }
        },
    },
    ["IndustrialOven"]       = {
        ["category"] = "Appliances_Cooking",
        ["textures"] = {
            { "appliances_cooking_01_20_sketch.png" }
        },
    },
    ["FryersClubIndustrial"] = {
        ["category"] = "Appliances_Cooking",
        ["textures"] = {
            { "appliances_cooking_01_52_sketch.png" }
        },
    },
    ["RedOven"]              = {
        ["category"] = "Appliances_Cooking",
        ["textures"] = {
            { "appliances_cooking_01_8_sketch.png" }
        },
    },
    ["AntiqueOven"]          = {
        ["category"] = "Appliances_Cooking",
        ["textures"] = {
            { "appliances_cooking_01_16_sketch.png" }
        },
    },
    ["ModernOven"]           = {
        ["category"] = "Appliances_Cooking",
        ["textures"] = {
            { "appliances_cooking_01_12_sketch.png" }
        },
    },


    -- Microwave ovens
    ["WhiteMicrowave"]  = {
        ["category"] = "Appliances_Cooking",
        ["textures"] = {
            { "appliances_cooking_01_24_sketch.png" }
        },
    },
    ["ChromeMicrowave"] = {
        ["category"] = "Appliances_Cooking",
        ["textures"] = {
            { "appliances_cooking_01_29_sketch.png" }
        },
    },


    -- Fridges
    ["PlainFridge"]           = {
        ["baseSketch"] = "BS_PlainFridge",
    },
    ["BlueFridge"]            = {
        ["baseSketch"] = "BS_PlainFridge",
    },
    ["MiniFridge"]            = {
        ["category"] = "Appliances_Fridges",
        ["textures"] = {
            { "appliances_refrigeration_01_24_sketch.png" }
        },
    },
    ["RedFridge"]             = {
        ["category"] = "Appliances_Fridges",
        ["textures"] = {
            { "appliances_refrigeration_01_33_sketch.png" }
        },
    },
    ["TrailerFridgeA"]        = {
        ["category"] = "Appliances_Fridges",
        ["textures"] = {
            { "location_trailer_02_17_sketch.png" }
        },
    },
    ["TrailerFridgeB"]        = {
        ["category"] = "Appliances_Fridges",
        ["textures"] = {
            { "location_trailer_02_10_sketch.png" }
        },
    },
    ["WhiteFridge"]           = {
        ["category"] = "Appliances_Fridges",
        ["textures"] = {
            { "appliances_refrigeration_01_1_sketch.png" }
        },
    },
    ["GreenFridge"]           = {
        ["category"] = "Appliances_Fridges",
        ["textures"] = {
            { "appliances_refrigeration_01_13_sketch.png" }
        },
    },
    ["IndustrialFridge"]      = {
        ["category"] = "Appliances_Fridges",
        ["textures"] = {
            { "appliances_refrigeration_01_23_sketch.png" }
        },
    },
    ["SteelFridge"]           = {
        ["category"] = "Appliances_Fridges",
        ["textures"] = {
            { "appliances_refrigeration_01_9_sketch.png" }
        },
    },
    ["LargeFridge"]           = {
        ["category"] = "Appliances_Fridges",
        ["textures"] = {
            { "appliances_refrigeration_01_17_sketch.png" },
            { "appliances_refrigeration_01_16_sketch.png" }
        },
    },
    ["WhiteIndustrialFridge"] = {
        ["category"] = "Appliances_Fridges",
        ["textures"] = {
            { "appliances_refrigeration_01_41_sketch.png" }
        },
    },
    ["GenericCooledShelves"]  = {
        ["category"] = "Appliances_Fridges",
        ["textures"] = {
            { "location_shop_generic_01_69_sketch.png" },
            { "location_shop_generic_01_68_sketch.png" },
            { "location_shop_generic_01_67_sketch.png" }
        },
    },
    ["PopsicleFridge"]        = {
        ["category"] = "Appliances_Fridges",
        ["textures"] = {
            { "appliances_refrigeration_01_21_sketch.png" },
            { "appliances_refrigeration_01_20_sketch.png" }
        },
    },


    -- Washing machines
    ["WhiteWashingMachine"]  = {
        ["category"] = "Appliances_Laundry",
        ["textures"] = {
            { "appliances_laundry_01_5_sketch.png" }
        },
    },
    ["BlueComboWasherDryer"] = {
        ["category"] = "Appliances_Laundry",
        ["textures"] = {
            { "appliances_laundry_01_1_sketch.png" }
        },
    },
    ["WhiteClothingDryer"]   = {
        ["category"] = "Appliances_Laundry",
        ["textures"] = {
            { "appliances_laundry_01_13_sketch.png" }
        },
    },


    -- Toilets
    ["HangingToilet"] = {
        ["category"] = "Appliances_Bathroom",
        ["textures"] = {
            { "fixtures_bathroom_01_9_sketch.png" }
        },
    },
    ["FancyToilet"]   = {
        ["category"] = "Appliances_Bathroom",
        ["textures"] = {
            { "fixtures_bathroom_01_1_sketch.png" }
        },
    },
    ["LowToilet"]     = {
        ["category"] = "Appliances_Bathroom",
        ["textures"] = {
            { "fixtures_bathroom_01_5_sketch.png" }
        },
    },


    -- Sinks
    ["ChromeSink"]         = {
        ["category"] = "Appliances_Bathroom",
        ["textures"] = {
            { "fixtures_sinks_01_8_sketch.png" }
        },
    },
    ["BeigeSink"]          = {
        ["category"] = "Appliances_Bathroom",
        ["textures"] = {
            { "fixtures_sinks_01_21_sketch.png" }
        },
    },
    ["IndustrialSink"]     = {
        ["category"] = "Appliances_Bathroom",
        ["textures"] = {
            { "fixtures_sinks_01_4_sketch.png" }
        },
    },
    ["WhiteStandingSink"]  = {
        ["category"] = "Appliances_Bathroom",
        ["textures"] = {
            { "fixtures_sinks_01_13_sketch.png" }
        },
    },
    ["WhiteHangingSink"]   = {
        ["category"] = "Appliances_Bathroom",
        ["textures"] = {
            { "fixtures_sinks_01_15_sketch.png" }
        },
    },
    ["DarkIndustrialSink"] = {
        ["category"] = "Appliances_Bathroom",
        ["textures"] = {
            { "fixtures_sinks_01_16_sketch.png" }
        },
    },
    ["WhiteSink"]          = {
        ["category"] = "Appliances_Bathroom",
        ["textures"] = {
            { "fixtures_sinks_01_1_sketch.png" }
        },
    },


    -- Showers
    ["DeluxeShower"]    = {
        ["category"] = "Appliances_Bathroom",
        ["textures"] = {
            { "fixtures_bathroom_01_33_sketch.png" }
        },
    },
    ["LargeDeluxeBath"] = {
        ["category"] = "Appliances_Bathroom",
        ["textures"] = {
            { "fixtures_bathroom_01_26_sketch.png", "fixtures_bathroom_01_27_sketch.png" }
        },
    },


    -- High Wire Fences
    ["WiredHighFenceCorner"]                 = {
        ["category"] = "Fences_High",
        ["textures"] = {
            { "fencing_01_84_sketch.png" }
        },
    },
    ["WiredHighFence"]                       = {
        ["category"] = "Fences_High",
        ["textures"] = {
            { "fencing_01_80_sketch.png", "fencing_01_81_sketch.png" }
        },
    },
    ["ChainlinkAndRazorWireHighFence"]       = {
        ["category"] = "Fences_High",
        ["textures"] = {
            { "fencing_01_48_sketch.png", "fencing_01_49_sketch.png" }
        },
    },
    ["ChainlinkAndRazorWireHighFenceCorner"] = {
        ["category"] = "Fences_High",
        ["textures"] = {
            { "fencing_01_52_sketch.png" }
        },
    },
    ["ChainlinkAndRazorWireHighFencePost"]   = {
        ["category"] = "Fences_High",
        ["textures"] = {
            { "fencing_01_53_sketch.png" }
        },
    },
    ["WiredRazorHighFence"]                  = {
        ["category"] = "Fences_High",
        ["textures"] = {
            { "fencing_01_88_sketch.png", "fencing_01_89_sketch.png" }
        },
    },
    ["WiredRazorHighFenceCorner"]            = {
        ["category"] = "Fences_High",
        ["textures"] = {
            { "fencing_01_92_sketch.png" }
        },
    },

    -- Metal Wrought Fences
    ["WroughtIronHighFence"]                 = {
        ["category"] = "Fences_High",
        ["textures"] = {
            { "fencing_01_64_sketch.png", "fencing_01_65_sketch.png" }
        },
    },
    ["WroughtIronHighFenceCorner"]           = {
        ["category"] = "Fences_High",
        ["textures"] = {
            { "fencing_01_68_sketch.png" }
        },
    },
    ["WroughtIronHighFencePost"]             = {
        ["category"] = "Fences_High",
        ["textures"] = {
            { "fencing_01_69_sketch.png" }
        },
    },
    ["WroughtIronLowFenceCorner"]            = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fencing_01_3_sketch.png" }
        },
    },
    ["WroughtIronLowFencePost"]              = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fencing_01_0_sketch.png" }
        },
    },
    ["WroughtIronLowFence"]                  = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fencing_01_1_sketch.png" }
        },
    },

    -- Armchairs
    ["RedModernArmchair"]                    = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_01_40_sketch.png" }
        },
    },


    ["BlackFancyArmchair"] = {
        ["baseSketch"] = "BS_FancyArmchair",
    },
    ["FancyWhiteArmchair"] = {
        ["baseSketch"] = "BS_FancyArmchair",
    },



    ["Victorian1Armchair"] = {
        ["baseSketch"] = "BS_ArmchairVictorianA",
    },
    ["Victorian2Armchair"] = {
        ["baseSketch"] = "BS_ArmchairVictorianA",
    },
    ["Victorian3Armchair"] = {
        ["baseSketch"] = "BS_ArmchairVictorianA",
    },


    ["Victorian4Armchair"] = {
        ["baseSketch"] = "BS_ArmchairVictorianB",
    },
    ["Victorian5Armchair"] = {
        ["baseSketch"] = "BS_ArmchairVictorianB",
    },
    ["Victorian6Armchair"] = {
        ["baseSketch"] = "BS_ArmchairVictorianB",
    },


    ["OrangeModernArmchair"] = {
        ["baseSketch"] = "BS_ArmchairModern",
    },
    ["WhiteModernArmchair"]  = {
        ["baseSketch"] = "BS_ArmchairModern",
    },
    ["YellowModernArmchair"] = {
        ["baseSketch"] = "BS_ArmchairModern",
    },


    ["GreenComfyArmchair"] = {
        ["baseSketch"] = "BS_ArmchairComfy",
    },
    ["BlueComfyArmchair"]  = {
        ["baseSketch"] = "BS_ArmchairComfy",
    },


    ["BrownLazyArmchair"] = {
        ["baseSketch"] = "BS_ArmchairLazy",
    },
    ["GreyLazyArmchair"]  = {
        ["baseSketch"] = "BS_ArmchairLazy",
    },
    ["WhiteLazyArmchair"] = {
        ["baseSketch"] = "BS_ArmchairLazy",
    },


    ["PurpleRattanArmchair"] = {
        ["baseSketch"] = "BS_ArmchairRattan",
    },
    ["BlueRattanArmchair"]   = {
        ["baseSketch"] = "BS_ArmchairRattan",
    },



    -- Restaurant seats
    ["SpiffoLoungeSeat"] = {
        ["baseSketch"] = "BS_RestaurantLoungeSeat",
    },
    ["PizzaWhirledSeat"] = {
        ["baseSketch"] = "BS_RestaurantLoungeSeat",
    },

    ["BlueSeat"]         = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "location_restaurant_pileocrepe_01_25_sketch.png" },
            { "location_restaurant_pileocrepe_01_24_sketch.png" }
        },
    },
    ["50sSeat"]          = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "location_restaurant_diner_01_35_sketch.png" },
            { "location_restaurant_diner_01_34_sketch.png" }
        },
    },

    -- Couches
    ["Victorian1Couch"]  = {
        ["baseSketch"] = "BS_CouchVictorianA",
    },
    ["Victorian2Couch"]  = {
        ["baseSketch"] = "BS_CouchVictorianA",
    },
    ["Victorian3Couch"]  = {
        ["baseSketch"] = "BS_CouchVictorianA",
    },


    ["Victorian4Couch"] = {
        ["baseSketch"] = "BS_CouchVictorianB",
    },
    ["Victorian5Couch"] = {
        ["baseSketch"] = "BS_CouchVictorianB",
    },
    ["Victorian6Couch"] = {
        ["baseSketch"] = "BS_CouchVictorianB",
    },


    ["BlueRattanCouch"]   = {
        ["baseSketch"] = "BS_CouchRattan",
    },
    ["PurpleRattanCouch"] = {
        ["baseSketch"] = "BS_CouchRattan",
    },


    ["BrownLazyCouch"] = {
        ["baseSketch"] = "BS_CouchLazy",
    },
    ["WhiteLazyCouch"] = {
        ["baseSketch"] = "BS_CouchLazy",
    },
    ["GreyLazyCouch"]  = {
        ["baseSketch"] = "BS_CouchLazy",
    },


    ["OrangeModernCouch"] = {
        ["baseSketch"] = "BS_CouchModern",
    },
    ["YellowModernCouch"] = {
        ["baseSketch"] = "BS_CouchModern",
    },


    ["GreenComfyCouch"] = {
        ["baseSketch"] = "BS_CouchComfy",
    },


    -- Beds
    ["HospitalBed"]    = {
        ["category"] = "Furniture_Beds",
        ["textures"] = {
            { "furniture_bedding_01_66_sketch.png", "furniture_bedding_01_67_sketch.png" }
        },
    },
    ["TwinBed"]        = {
        ["category"] = "Furniture_Beds",
        ["textures"] = {
            { "furniture_bedding_01_36_sketch.png", "furniture_bedding_01_37_sketch.png" }
        },
    },
    ["StretcherBed"]   = {
        ["category"] = "Furniture_Beds",
        ["textures"] = {
            { "furniture_bedding_01_58_sketch.png", "furniture_bedding_01_59_sketch.png" }
        },
    },
    ["FancyBed"]       = {
        ["category"] = "Furniture_Beds",
        ["textures"] = {
            { "furniture_bedding_01_2_sketch.png", "furniture_bedding_01_3_sketch.png" }
        },
    },
    ["SimpleBed"]      = {
        ["category"] = "Furniture_Beds",
        ["textures"] = {
            { "furniture_bedding_01_32_sketch.png", "furniture_bedding_01_33_sketch.png" }
        },
    },
    ["BunkBed"]        = {
        ["category"] = "Furniture_Beds",
        ["textures"] = {
            { "furniture_bedding_01_86_sketch.png", "furniture_bedding_01_87_sketch.png" }
        },
    },
    ["BlueBed"]        = {
        ["category"] = "Furniture_Beds",
        ["textures"] = {
            { "furniture_bedding_01_10_sketch.png", "furniture_bedding_01_11_sketch.png" }
        },
    },

    -- Large Beds
    ["LargeFancyBed"]  = {
        ["category"] = "Furniture_Beds",
        ["textures"] = {
            { "furniture_bedding_01_14_sketch.png", "furniture_bedding_01_15_sketch.png" },
            { "furniture_bedding_01_12_sketch.png", "furniture_bedding_01_13_sketch.png" }
        },
    },
    ["LargeOakBed"]    = {
        ["category"] = "Furniture_Beds",
        ["textures"] = {
            { "furniture_bedding_01_42_sketch.png", "furniture_bedding_01_43_sketch.png" },
            { "furniture_bedding_01_40_sketch.png", "furniture_bedding_01_41_sketch.png" }
        },
    },
    ["LargeModernBed"] = {
        ["category"] = "Furniture_Beds",
        ["textures"] = {
            { "furniture_bedding_01_30_sketch.png", "furniture_bedding_01_31_sketch.png" },
            { "furniture_bedding_01_28_sketch.png", "furniture_bedding_01_29_sketch.png" }
        },
    },


    -- Carpets
    ["FloorGreyCarpet"]           = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorYellowCarpet"]         = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorBlueCarpet"]           = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorDarkRedCarpet"]        = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorLightGreenCarpet"]     = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorBrownCarpet"]          = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorRedCarpet"]            = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorGreenCarpet"]          = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorBeigeCarpet"]          = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorPurpleCarpet"]         = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorWhiteCarpet"]          = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorGreenesGroceryCarpet"] = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorBlackCarpet"]          = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorBordeauxCarpet"]       = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorDarkGreyCarpet"]       = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorGreyCurlyCarpet"]      = {
        ["baseSketch"] = "BS_FloorCarpet",
    },
    ["FloorVioletCarpet"]         = {
        ["baseSketch"] = "BS_FloorCarpet",
    },


    -- Rugs
    ["BathroomBrownRug"]  = {
        ["category"] = "Decorations_Rugs",
        ["textures"] = {
            { "floors_rugs_01_48_sketch.png", "floors_rugs_01_49_sketch.png" }
        },
    },
    ["BathroomPurpleRug"] = {
        ["category"] = "Decorations_Rugs",
        ["textures"] = {
            { "floors_rugs_01_52_sketch.png", "floors_rugs_01_53_sketch.png" }
        },
    },
    ["DoorMat"]           = {
        ["category"] = "Decorations_Rugs",
        ["textures"] = {
            { "floors_rugs_01_56_sketch.png", "floors_rugs_01_57_sketch.png" }
        },
    },


    ["BordeauxRug"]           = {
        ["baseSketch"] = "BS_FloorRug",
    },
    ["BordeauxSideRug"]       = {
        ["baseSketch"] = "BS_FloorRugSide",
    },
    ["BordeauxRugCorner"]     = {
        ["baseSketch"] = "BS_FloorRugCorner",
    },
    ["BordeauxVictorian1Rug"] = {
        ["baseSketch"] = "BS_FloorRugInnerCorner",
    },
    ["BordeauxVictorian2Rug"] = {
        ["baseSketch"] = "BS_FloorRug",
    },


    ["DarkPurpleRug"]           = {
        ["baseSketch"] = "BS_FloorRug",
    },
    ["DarkPurpleSideRug"]       = {
        ["baseSketch"] = "BS_FloorRugSide",
    },
    ["DarkPurpleRugCorner"]     = {
        ["baseSketch"] = "BS_FloorRugCorner",
    },
    ["DarkPurpleVictorian1Rug"] = {
        ["baseSketch"] = "BS_FloorRugInnerCorner",
    },
    ["DarkPurpleVictorian2Rug"] = {
        ["baseSketch"] = "BS_FloorRug",
    },


    ["FancyOrangeRug"]       = {
        ["baseSketch"] = "BS_FloorRug",
    },
    ["FancyOrangeRugCorner"] = {
        ["baseSketch"] = "BS_FloorRugCorner",
    },


    ["DarkGreyRug"]     = {
        ["baseSketch"] = "BS_FloorRug",
    },
    ["DarkGreySideRug"] = {
        ["baseSketch"] = "BS_FloorRugSide",
    },


    ["FancyBrownRug"]       = {
        ["baseSketch"] = "BS_FloorRug",
    },
    ["FancyBrownRugCorner"] = {
        ["baseSketch"] = "BS_FloorRugCorner",
    },


    ["DarkGreenRug"]           = {
        ["baseSketch"] = "BS_FloorRug",
    },
    ["DarkGreenSideRug"]       = {
        ["baseSketch"] = "BS_FloorRugSide",
    },
    ["DarkGreenRugCorner"]     = {
        ["baseSketch"] = "BS_FloorRugCorner",
    },
    ["DarkGreenVictorian1Rug"] = {
        ["baseSketch"] = "BS_FloorRugInnerCorner",
    },
    ["DarkGreenVictorian2Rug"] = {
        ["baseSketch"] = "BS_FloorRug",
    },


    ["FancyBlueRug"]       = {
        ["baseSketch"] = "BS_FloorRug",
    },
    ["FancyBlueRugCorner"] = {
        ["baseSketch"] = "BS_FloorRugCorner",
    },


    ["FancyGreenRug"]       = {
        ["baseSketch"] = "BS_FloorRug",
    },
    ["FancyGreenRugCorner"] = {
        ["baseSketch"] = "BS_FloorRugCorner",
    },


    -- Others
    ["GreyMilitaryCrate"]    = {
        ["baseSketch"] = "BS_MilitaryCrate",
    },
    ["GreenMilitaryCrate"]   = {
        ["baseSketch"] = "BS_MilitaryCrate",
    },
    ["SmallWoodenCrate"]     = {
        ["category"] = "Containers_Crates",
        ["textures"] = {
            { "location_shop_greenes_01_35_sketch.png" }
        },
    },
    ["VegetableBasket"]      = {
        ["category"] = "Containers_Crates",
        ["textures"] = {
            { "location_shop_greenes_01_38_sketch.png" }
        },
    },
    ["BatteredCardboardBox"] = {
        ["category"] = "Containers_Crates",
        ["textures"] = {
            { "trashcontainers_01_27_sketch.png" }
        },
    },
    ["BigCardboardBox"]      = {
        ["category"] = "Containers_Crates",
        ["textures"] = {
            { "furniture_storage_02_17_sketch.png" }
        },
    },


    -- Low Tables
    ["LongLowTable"]      = {
        ["baseSketch"] = "BS_LongLowTable",
    },
    ["LongLightLowTable"] = {
        ["baseSketch"] = "BS_LongLowTable",
    },
    ["LongDarkLowTable"]  = {
        ["baseSketch"] = "BS_LongLowTable",
    },


    ["BrownLowTable"]        = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "furniture_tables_low_01_12_sketch.png" }
        },
    },
    ["FancyLowTable"]        = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "furniture_tables_low_01_2_sketch.png" }
        },
    },
    ["LightLowTable"]        = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "furniture_tables_low_01_16_sketch.png" }
        },
    },
    ["PlasticLowTable"]      = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "furniture_tables_low_01_21_sketch.png" }
        },
    },
    ["BlackModernLowTable"]  = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "furniture_tables_low_01_18_sketch.png" }
        },
    },

    -- Large Tables
    ["BleachedLargeTable"]   = {
        ["baseSketch"] = "BS_LargeWoodenTable",
    },
    ["BroadWhiteLargeTable"] = {
        ["baseSketch"] = "BS_LargeWoodenTable",
    },
    ["BrownLargeTable"]      = {
        ["baseSketch"] = "BS_LargeWoodenTable",
    },
    ["DarkLargeTable"]       = {
        ["baseSketch"] = "BS_LargeWoodenTable",
    },
    ["DarkOakLargeTable"]    = {
        ["baseSketch"] = "BS_LargeWoodenTable",
    },
    ["DarkWoodenLargeTable"] = {
        ["baseSketch"] = "BS_LargeWoodenTable",
    },
    ["LightOakLargeTable"]   = {
        ["baseSketch"] = "BS_LargeWoodenTable",
    },
    ["OakLargeTable"]        = {
        ["baseSketch"] = "BS_LargeWoodenTable",
    },


    ["LightRoundLargeTable"] = {
        ["baseSketch"] = "BS_LargeRoundWoodenTable",
    },
    ["OakRoundLargeTable"]   = {
        ["baseSketch"] = "BS_LargeRoundWoodenTable",
    },


    ["FancyLargeTable"]     = {
        ["baseSketch"] = "BS_FancyLargeTable",
    },
    ["FancyDarkLargeTable"] = {
        ["baseSketch"] = "BS_FancyLargeTable",
    },


    ["SpiffoTypeALargeTable"] = {
        ["baseSketch"] = "BS_SpiffoLargeTable",
    },
    ["SpiffoTypeBLargeTable"] = {
        ["baseSketch"] = "BS_SpiffoLargeTable",
    },


    ["SmoothPlasticLargeTable"] = {
        ["baseSketch"] = "BS_SmoothLargeTable",
    },
    ["SmoothLargeTable"]        = {
        ["baseSketch"] = "BS_SmoothLargeTable",
    },


    ["LightWoodRestaurantLargeTable"] = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "location_restaurant_pileocrepe_01_37_sketch.png" }
        },
    },
    ["PlasticLargeTable"]             = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "furniture_tables_high_01_47_sketch.png" },
            { "furniture_tables_high_01_46_sketch.png" }
        },
    },
    ["SimpleLargeTable"]              = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "furniture_tables_high_01_55_sketch.png" },
            { "furniture_tables_high_01_54_sketch.png" }
        },
    },
    ["LongLowDoubleTable"]            = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "furniture_tables_low_01_1_sketch.png" },
            { "furniture_tables_low_01_0_sketch.png" }
        },
    },

    -- Large Desks
    ["BrownOfficeLargeDesk"]          = {
        ["baseSketch"] = "BS_LargeOfficeDesk",
    },
    ["OfficeLargeDesk"]               = {
        ["baseSketch"] = "BS_LargeOfficeDesk",
    },

    ["LightwoodLargeDesk"]            = {
        ["category"] = "Furniture_Tables",
        ["textures"] = {
            { "furniture_tables_high_01_25_sketch.png" },
            { "furniture_tables_high_01_24_sketch.png" }
        },
    },

    -- Commercial
    ["FossoilCounter"]                = {
        ["baseSketch"] = "BS_GenericShopCounter",
    },
    ["FossoilCounterCorner"]          = {
        ["baseSketch"] = "BS_GenericShopCounterCorner",
    },
    ["Gas2GoCounter"]                 = {
        ["baseSketch"] = "BS_GenericShopCounter",
    },
    ["Gas2GoCounterCorner"]           = {
        ["baseSketch"] = "BS_GenericShopCounterCorner",
    },
    ["GenericShopCounter"]            = {
        ["baseSketch"] = "BS_GenericShopCounter",
    },
    ["GenericShopCounterCorner"]      = {
        ["baseSketch"] = "BS_GenericShopCounterCorner",
    },
    ["TrapezoidShopShelves"]          = {
        ["baseSketch"] = "BS_TrapezoidShopShelves",
    },
    ["ShopDisplayCounter"]            = {
        ["baseSketch"] = "BS_GenericDisplayStand",
    },
    ["GlassDisplayStand"]             = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_pie_01_49_sketch.png" },
            { "location_restaurant_pie_01_48_sketch.png" }
        },
    },
    ["GlassDisplayCounterCorner"]     = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_shop_generic_01_102_sketch.png" }
        },
    },
    ["GlassDisplayCounter"]           = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_shop_generic_01_103_sketch.png" }
        },
    },
    ["GroceryDisplayCounter"]         = {
        ["baseSketch"] = "BS_GenericDisplayStand",
    },
    ["GroceryTrapezoidCounter"]       = {
        ["baseSketch"] = "BS_TrapezoidShopShelves",
    },
    ["LargeShopShelves"]              = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_shop_generic_01_75_sketch.png" },
            { "location_shop_generic_01_74_sketch.png" }
        },
    },
    ["RoundedGlassDisplayCounter"]    = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_shop_generic_01_33_sketch.png" },
            { "location_shop_generic_01_32_sketch.png" }
        },
    },
    ["WhiteDisplayCounter"]           = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_shop_generic_01_85_sketch.png" },
            { "location_shop_generic_01_84_sketch.png" },
            { "location_shop_generic_01_83_sketch.png" }
        },
    },
    ["WhiteStrippedCounterCorner"]    = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_pie_01_42_sketch.png" }
        },
    },
    ["WhiteStrippedCounter"]          = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_pie_01_43_sketch.png" }
        },
    },
    ["WhiteStrippedDisplayStand"]     = {
        ["baseSketch"] = "BS_GenericDisplayStand",
    },

    -- Restaurant
    ["SpiffosCounter"]                = {
        ["baseSketch"] = "BS_GenericShopCounter",
    },
    ["SpiffosCounterCorner"]          = {
        ["baseSketch"] = "BS_GenericShopCounterCorner",
    },
    ["TheaterCounterCorner"]          = {
        ["baseSketch"] = "BS_GenericShopCounterCorner",
    },
    ["TheaterCounter"]                = {
        ["baseSketch"] = "BS_GenericShopCounter",
    },
    ["ZippeeCounter"]                 = {
        ["baseSketch"] = "BS_GenericShopCounter",
    },
    ["ZippeeCounterCorner"]           = {
        ["baseSketch"] = "BS_GenericShopCounterCorner",
    },
    ["DinerCounter"]                  = {
        ["baseSketch"] = "BS_GenericShopCounter",
    },
    ["DinerCounterCorner"]            = {
        ["baseSketch"] = "BS_GenericShopCounterCorner",
    },
    ["SeahorseCoffeeCounter"]         = {
        ["baseSketch"] = "BS_GenericShopCounter",
    },
    ["SeahorseCoffeeCounterCorner"]   = {
        ["baseSketch"] = "BS_GenericShopCounterCorner",
    },
    ["SquareTheaterCounter"]          = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_entertainment_theatre_01_16_sketch.png" }
        },
    },
    ["BlackBarCounterCorner"]         = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_bar_01_22_sketch.png" }
        },
    },
    ["BarBlackWallBar"]               = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_bar_01_73_sketch.png" }
        },
    },
    ["BarBrownWallBar"]               = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_bar_01_38_sketch.png" }
        },
    },
    ["LeftBarBlackWallBar"]           = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_bar_01_72_sketch.png" }
        },
    },
    ["LeftBarBrownWallBar"]           = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_bar_01_37_sketch.png" }
        },
    },
    ["RightBarBlackWallBar"]          = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_bar_01_74_sketch.png" }
        },
    },
    ["RightBarBrownWallBar"]          = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_bar_01_39_sketch.png" }
        },
    },
    ["PizzaWhirledCounter"]           = {
        ["baseSketch"] = "BS_GenericShopCounter",
    },
    ["PizzaWhirledCounterCorner"]     = {
        ["baseSketch"] = "BS_GenericShopCounterCorner",
    },
    ["OakBarCounterCorner"]           = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_bar_01_62_sketch.png" }
        },
    },
    ["BlackBarCounter"]               = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_bar_01_23_sketch.png" }
        },
    },
    ["BrownBarCounterCorner"]         = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_bar_01_6_sketch.png" }
        },
    },
    ["BrownBarCounter"]               = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_bar_01_7_sketch.png" }
        },
    },
    ["OakBarCounter"]                 = {
        ["category"] = "Containers_Commercial",
        ["textures"] = {
            { "location_restaurant_bar_01_63_sketch.png" }
        },
    },

    -- Residential
    ["BirchwoodCounter"]              = {
        ["baseSketch"] = "BS_GenericResidentialCounter",
    },
    ["BirchwoodCounterCorner"]        = {
        ["baseSketch"] = "BS_GenericResidentialCounterCorner",
    },
    ["BirchwoodFloatingCounter"]      = {
        ["baseSketch"] = "BS_TrailerFloatingCounter",
    },
    ["DarkCounter"]                   = {
        ["baseSketch"] = "BS_GenericResidentialCounter",
    },
    ["DarkCounterCorner"]             = {
        ["baseSketch"] = "BS_GenericResidentialCounterCorner",
    },
    ["TrailerFloatingCounter"]        = {
        ["baseSketch"] = "BS_TrailerFloatingCounter",
    },
    ["TrailerCounter"]                = {
        ["baseSketch"] = "BS_GenericResidentialCounter",
    },
    ["GreenCounter"]                  = {
        ["baseSketch"] = "BS_GenericResidentialCounter",
    },
    ["GreenCounterCorner"]            = {
        ["baseSketch"] = "BS_GenericResidentialCounterCorner",
    },
    ["ModernCounter"]                 = {
        ["baseSketch"] = "BS_GenericResidentialCounter",
    },
    ["ModernCounterCorner"]           = {
        ["baseSketch"] = "BS_GenericResidentialCounterCorner",
    },

    ["MotelCounter"]                  = {
        ["category"] = "Containers_Residential",
        ["textures"] = {
            { "location_hospitality_sunstarmotel_02_13_sketch.png" }
        },
    },
    ["MotelCounterCorner"]            = {
        ["category"] = "Containers_Residential",
        ["textures"] = {
            { "location_hospitality_sunstarmotel_02_21_sketch.png" }
        },
    },

    ["OakCounter"]                    = {
        ["baseSketch"] = "BS_GenericResidentialCounter",
    },
    ["OakCounterCorner"]              = {
        ["baseSketch"] = "BS_GenericResidentialCounterCorner",
    },
    ["WhiteCounter"]                  = {
        ["baseSketch"] = "BS_GenericResidentialCounter",
    },
    ["WhiteCounterCorner"]            = {
        ["baseSketch"] = "BS_GenericResidentialCounterCorner",
    },
    ["WoodenCounter"]                 = {
        ["baseSketch"] = "BS_GenericResidentialCounter",
    },
    ["WoodenCounterCorner"]           = {
        ["baseSketch"] = "BS_GenericResidentialCounterCorner",
    },

    -- Metal Containers
    ["MedicalMetalCounter"]           = {
        ["category"] = "Containers_Metal",
        ["textures"] = {
            { "location_community_medical_01_153_sketch.png" },
            { "location_community_medical_01_152_sketch.png" }
        },
    },
    ["MilitaryLocker"]                = {
        ["category"] = "Containers_Metal",
        ["textures"] = {
            { "location_military_generic_01_23_sketch.png" }
        },
    },
    ["LargeMetalShelves"]             = {
        ["category"] = "Containers_Metal",
        ["textures"] = {
            { "furniture_shelving_01_25_sketch.png" },
            { "furniture_shelving_01_24_sketch.png" }
        },
    },
    ["StandingVault"]                 = {
        ["category"] = "Containers_Metal",
        ["textures"] = {
            { "location_business_bank_01_43_sketch.png" }
        },
    },
    ["BlueWallLocker"]                = {
        ["baseSketch"] = "BS_WallLocker",
    },
    ["YellowWallLocker"]              = {
        ["baseSketch"] = "BS_WallLocker",
    },
    ["GreyFileCabinet"]               = {
        ["category"] = "Containers_Metal",
        ["textures"] = {
            { "location_business_office_generic_01_17_sketch.png" }
        },
    },
    ["WallBin"]                       = {
        ["category"] = "Containers_Metal",
        ["textures"] = {
            { "trashcontainers_01_32_sketch.png" }
        },
    },
    ["WallVault"]                     = {
        ["category"] = "Containers_Metal",
        ["textures"] = {
            { "location_business_bank_01_40_sketch.png" }
        },
    },

    -- Metal Clothes Racks
    ["WhiteFileCabinet"]              = {
        ["category"] = "Containers_Metal",
        ["textures"] = {
            { "location_business_office_generic_01_33_sketch.png" }
        },
    },
    ["SmallClothesRack"]              = {
        ["category"] = "Containers_Metal",
        ["textures"] = {
            { "location_shop_generic_01_49_sketch.png" },
            { "location_shop_generic_01_48_sketch.png" }
        },
    },
    ["ClothesStand"]                  = {
        ["category"] = "Containers_Metal",
        ["textures"] = {
            { "location_shop_generic_01_52_sketch.png" }
        },
    },
    ["LargeClothesRack"]              = {
        ["category"] = "Containers_Metal",
        ["textures"] = {
            { "location_shop_generic_01_37_sketch.png" },
            { "location_shop_generic_01_36_sketch.png" }
        },
    },

    -- Trashcans
    ["GreyGarbageBin"]                = {
        ["baseSketch"] = "BS_GarbageBin",
    },
    ["SpiffosBin"]                    = {
        ["category"] = "Containers_Trashcans",
        ["textures"] = {
            { "location_restaurant_spiffos_01_31_sketch.png" }
        },
    },
    ["FossoilGarbageBin"]             = {
        ["baseSketch"] = "BS_GarbageBin",
    },
    ["GreenGarbageBin"]               = {
        ["category"] = "Containers_Trashcans",
        ["textures"] = {
            { "trashcontainers_01_17_sketch.png" }
        },
    },
    ["WheelieBin"]                    = {
        ["category"] = "Containers_Trashcans",
        ["textures"] = {
            { "trashcontainers_01_1_sketch.png" }
        },
    },
    ["PublicGarbageBin"]              = {
        ["category"] = "Containers_Trashcans",
        ["textures"] = {
            { "trashcontainers_01_21_sketch.png" }
        },
    },
    ["MallGarbageBin"]                = {
        ["category"] = "Containers_Trashcans",
        ["textures"] = {
            { "location_shop_mall_01_44_sketch.png" }
        },
    },
    ["BlueDumpster"]                  = {
        ["baseSketch"] = "BS_BigDumpster",
    },
    ["OrangeDumpster"]                = {
        ["baseSketch"] = "BS_BigDumpster",
    },
    ["RoundBin"]                      = {
        ["category"] = "Containers_Trashcans",
        ["textures"] = {
            { "trashcontainers_01_20_sketch.png" }
        },
    },
    ["RecycleBin"]                    = {
        ["category"] = "Containers_Trashcans",
        ["textures"] = {
            { "trashcontainers_01_16_sketch.png" }
        },
    },

    -- Concrete
    ["ConcreteRoadBlock"]             = {
        ["category"] = "Decorations_Roadway",
        ["textures"] = {
            { "street_decoration_01_29_sketch.png" }
        },
    },
    ["ConcreteWheelStop"]             = {
        ["category"] = "Decorations_Roadway",
        ["textures"] = {
            { "street_decoration_01_37_sketch.png" },
            { "street_decoration_01_36_sketch.png" },
            { "street_decoration_01_35_sketch.png" }
        },
    },

    -- Others
    ["RoadConeBig"]                   = {
        ["category"] = "Decorations_Roadway",
        ["textures"] = {
            { "street_decoration_01_27_sketch.png" }
        },
    },
    ["PostBarrier"]                   = {
        ["category"] = "Decorations_Roadway",
        ["textures"] = {
            { "street_decoration_01_64_sketch.png", "street_decoration_01_65_sketch.png", "street_decoration_01_66_sketch.png", "street_decoration_01_67_sketch.png" }
        },
    },
    ["Standpipe"]                     = {
        ["category"] = "Decorations_Roadway",
        ["textures"] = {
            { "street_decoration_01_12_sketch.png" }
        },
    },
    ["RoadBlock"]                     = {
        ["category"] = "Decorations_Roadway",
        ["textures"] = {
            { "construction_01_9_sketch.png" }
        },
    },
    ["RoadConeSmall"]                 = {
        ["category"] = "Decorations_Roadway",
        ["textures"] = {
            { "street_decoration_01_26_sketch.png" }
        },
    },
    ["MailBox"]                       = {
        ["category"] = "Decorations_Roadway",
        ["textures"] = {
            { "street_decoration_01_18_sketch.png" }
        },
    },
    ["PublicMailBox"]                 = {
        ["category"] = "Decorations_Roadway",
        ["textures"] = {
            { "street_decoration_01_9_sketch.png" }
        },
    },

    -- Asphalt Floors
    ["BeigeAsphaltFloor"]             = {
        ["baseSketch"] = "BS_FloorAsphalt",
    },
    ["BeigeAsphaltCornerFloor"]       = {
        ["baseSketch"] = "BS_FloorAsphaltCorner",
    },

    ["MediumAsphaltFloor"]            = {
        ["baseSketch"] = "BS_FloorAsphalt",
    },
    ["MediumAsphaltCornerFloor"]      = {
        ["baseSketch"] = "BS_FloorAsphaltCorner",
    },
    ["MediumAsphaltEdgeFloor"]        = {
        ["baseSketch"] = "BS_FloorAsphaltEdge",
    },

    ["LightAsphaltFloor"]             = {
        ["baseSketch"] = "BS_FloorAsphalt",
    },
    ["LightAsphaltCornerFloor"]       = {
        ["baseSketch"] = "BS_FloorAsphaltCorner",
    },
    ["LightAsphaltEdgeFloor"]         = {
        ["baseSketch"] = "BS_FloorAsphaltEdge",
    },

    ["DarkAsphaltFloor"]              = {
        ["baseSketch"] = "BS_FloorAsphalt",
    },
    ["DarkAsphaltCornerFloor"]        = {
        ["baseSketch"] = "BS_FloorAsphaltCorner",
    },
    ["DarkAsphaltEdgeFloor"]          = {
        ["baseSketch"] = "BS_FloorAsphaltEdge",
    },

    ["OldAsphaltFloor"]               = {
        ["baseSketch"] = "BS_FloorAsphalt",
    },
    ["OldAsphaltCornerFloor"]         = {
        ["baseSketch"] = "BS_FloorAsphaltCorner",
    },
    ["OldAsphaltEdgeFloor"]           = {
        ["baseSketch"] = "BS_FloorAsphaltEdge",
    },


    -- Concrete Floors
    ["ConcreteFloor"]            = {
        ["baseSketch"] = "BS_FloorSmoothConcrete",
    },
    ["ConcreteCornerFloor"]      = {
        ["baseSketch"] = "BS_FloorSmoothConcrete",
    },

    -- Smooth Floors
    ["DarkGreySmoothTilesFloor"] = {
        ["baseSketch"] = "BS_FloorSmoothConcrete",
    },
    ["WhiteSmoothTilesFloor"]    = {
        ["baseSketch"] = "BS_FloorSmoothConcrete",
    },
    ["BeigeSmoothTilesFloor"]    = {
        ["baseSketch"] = "BS_FloorSmoothConcrete",
    },
    ["GreySmoothTilesFloor"]     = {
        ["baseSketch"] = "BS_FloorSmoothConcrete",
    },

    -- Wooden Floors
    ["WoodFloorBirchwood"]       = {
        ["baseSketch"] = "BS_FloorSimpleWooden",
    },
    ["WoodFloorChestnut"]        = {
        ["baseSketch"] = "BS_FloorSimpleWooden",
    },
    ["WoodFloorCinnamon"]        = {
        ["baseSketch"] = "BS_FloorSimpleWooden",
    },
    ["WoodFloorOakwood"]         = {
        ["baseSketch"] = "BS_FloorSimpleWooden",
    },


    ["WoodFloorWidePlank"]              = {
        ["category"] = "Floors_Wooden",
        ["textures"] = {
            { "industry_railroad_05_44_sketch.png" }
        },
    },
    ["WoodFloorPinewood"]               = {
        ["category"] = "Floors_Wooden",
        ["textures"] = {
            { "floors_interior_tilesandwood_01_52_sketch.png" }
        },
    },
    ["WoodFloorFinewood"]               = {
        ["category"] = "Floors_Wooden",
        ["textures"] = {
            { "floors_interior_tilesandwood_01_45_sketch.png" }
        },
    },
    ["WoodFloorHardwood"]               = {
        ["category"] = "Floors_Wooden",
        ["textures"] = {
            { "floors_interior_tilesandwood_01_40_sketch.png" }
        },
    },

    -- Ceramic Tile Floors
    ["CeramicFloorGreyDiagonalTiles"]   = {
        ["baseSketch"] = "BS_FloorCeramicDiagonal",
    },
    ["CeramicFloorWhiteDiagonalTiles"]  = {
        ["baseSketch"] = "BS_FloorCeramicDiagonal",
    },
    ["CeramicFloorBlackDiagonalTiles"]  = {
        ["baseSketch"] = "BS_FloorCeramicDiagonal",
    },
    ["CeramicFloorGreenDiagonalTiles"]  = {
        ["baseSketch"] = "BS_FloorCeramicDiagonal",
    },
    ["CeramicFloorBrownDiagonalTiles"]  = {
        ["baseSketch"] = "BS_FloorCeramicDiagonal",
    },
    ["CeramicFloorYellowDiagonalTiles"] = {
        ["baseSketch"] = "BS_FloorCeramicDiagonal",
    },


    ["CeramicFloorAcaciaTiles"]          = {
        ["baseSketch"] = "BS_FloorCeramicCheckered",
    },
    ["CeramicFloorHardwoodTiles"]        = {
        ["baseSketch"] = "BS_FloorCeramicCheckered",
    },
    ["CeramicFloorBirchwoodTiles"]       = {
        ["baseSketch"] = "BS_FloorCeramicCheckered",
    },
    ["CeramicFloorCinnamonTiles"]        = {
        ["baseSketch"] = "BS_FloorCeramicCheckered",
    },
    ["CeramicFloorGreyCheckeredTiles"]   = {
        ["baseSketch"] = "BS_FloorCeramicCheckered",
    },
    ["CeramicFloorYellowCheckeredTiles"] = {
        ["baseSketch"] = "BS_FloorCeramicCheckered",
    },
    ["CeramicFloorBrownCheckeredTiles"]  = {
        ["baseSketch"] = "BS_FloorCeramicCheckered",
    },
    ["CeramicFloorBlueCheckeredTiles"]   = {
        ["baseSketch"] = "BS_FloorCeramicCheckered",
    },
    ["CeramicFloorBeigeCheckeredTiles"]  = {
        ["baseSketch"] = "BS_FloorCeramicCheckered",
    },
    ["CeramicFloorWhiteCheckeredTiles"]  = {
        ["baseSketch"] = "BS_FloorCeramicCheckered",
    },


    ["CeramicFloorDarkGreyTiles"]        = {
        ["baseSketch"] = "BS_FloorCeramicBigSquares",
    },
    ["CeramicFloorBlackTiles"]           = {
        ["baseSketch"] = "BS_FloorCeramicBigSquares",
    },
    ["CeramicFloorGreyTiles"]            = {
        ["baseSketch"] = "BS_FloorCeramicBigSquares",
    },
    ["CeramicFloorBrownTiles"]           = {
        ["baseSketch"] = "BS_FloorCeramicBigSquares",
    },
    ["CeramicFloorGreySquaresTiles"]     = {
        ["baseSketch"] = "BS_FloorCeramicBigSquares",
    },
    ["CeramicFloorGreenTiles"]           = {
        ["baseSketch"] = "BS_FloorCeramicBigSquares",
    },
    ["CeramicFloorPurpleTiles"]          = {
        ["baseSketch"] = "BS_FloorCeramicBigSquares",
    },
    ["CeramicFloorDarkGreySquaresTiles"] = {
        ["baseSketch"] = "BS_FloorCeramicBigSquares",
    },


    -- Wooden Stairs
    ["DarkBrownWoodenStairs"]               = {
        ["baseSketch"] = "BS_WoodenStairs",
    },
    ["YellowBrownWoodenStairs"]             = {
        ["baseSketch"] = "BS_WoodenStairs",
    },
    ["WhiteIndustrialWoodenStairs"]         = {
        ["baseSketch"] = "BS_WoodenStairs",
    },
    ["SimpleWoodenStairs"]                  = {
        ["baseSketch"] = "BS_WoodenStairs",
    },
    ["WhiteMotelWoodenStairs"]              = {
        ["baseSketch"] = "BS_WoodenStairs",
    },
    ["BrownWoodenStairs"]                   = {
        ["baseSketch"] = "BS_WoodenStairs",
    },

    -- Wooden High Fences
    ["WoodenDecorativeHighFencePost"]       = {
        ["category"] = "Fences_High",
        ["textures"] = {
            { "fencing_01_13_sketch.png" }
        },
    },
    ["WoodenHighFenceCorner"]               = {
        ["category"] = "Fences_High",
        ["textures"] = {
            { "fencing_01_75_sketch.png" }
        },
    },
    ["WoodenHighFencePost"]                 = {
        ["category"] = "Fences_High",
        ["textures"] = {
            { "fencing_01_74_sketch.png" }
        },
    },
    ["WoodenDecorativeHighFence"]           = {
        ["category"] = "Fences_High",
        ["textures"] = {
            { "fencing_01_8_sketch.png", "fencing_01_9_sketch.png" }
        },
    },
    ["WoodenHighFence"]                     = {
        ["category"] = "Fences_High",
        ["textures"] = {
            { "fencing_01_73_sketch.png" }
        },
    },

    -- Wooden Low Fences
    ["LowWoodenWhiteRailingPost"]           = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fixtures_railings_01_67_sketch.png" }
        },
    },
    ["LowWoodenWhiteRailingTallPost"]       = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fixtures_railings_01_73_sketch.png" }
        },
    },
    ["LowWoodenRailingPost"]                = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fixtures_railings_01_27_sketch.png" }
        },
    },
    ["LowWoodenGreyFenceCorner"]            = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "walls_exterior_wooden_01_62_sketch.png" }
        },
    },
    ["LowWoodenRailingTallPost"]            = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fixtures_railings_01_33_sketch.png" }
        },
    },
    ["LowWoodenRailing"]                    = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fixtures_railings_01_25_sketch.png" }
        },
    },
    ["LowWoodenWhiteRailingCornerTallPost"] = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fixtures_railings_01_74_sketch.png" }
        },
    },
    ["LowWoodenWhitePicketFence"]           = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fencing_01_5_sketch.png" }
        },
    },
    ["LowWoodenRailingCorner"]              = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fixtures_railings_01_26_sketch.png" }
        },
    },
    ["LowWoodenWhitePicketFenceCorner"]     = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fencing_01_6_sketch.png" }
        },
    },
    ["LowWoodenGreyFence"]                  = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "walls_exterior_wooden_01_61_sketch.png" }
        },
    },
    ["LowWoodenGreyFencePost"]              = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "walls_exterior_wooden_01_63_sketch.png" }
        },
    },
    ["LowWoodenRailingCornerTallPost"]      = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fixtures_railings_01_34_sketch.png" }
        },
    },
    ["HescoBarrier"]                        = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fencing_01_96_sketch.png" }
        },
    },
    ["LowWoodenWhiteRailing"]               = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fixtures_railings_01_65_sketch.png" }
        },
    },
    ["LowWoodenWhitePicketFencePost"]       = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fencing_01_7_sketch.png" }
        },
    },
    ["LowWoodenWhiteRailingCorner"]         = {
        ["category"] = "Fences_Low",
        ["textures"] = {
            { "fixtures_railings_01_66_sketch.png" }
        },
    },

    -- Metal Floors
    ["MetalBrownRailroadFloor"]             = {
        ["baseSketch"] = "BS_FloorRailroadPanel",
    },
    ["MetalGreyRailroadPanelFloor"]         = {
        ["baseSketch"] = "BS_FloorRailroadPanel",
    },

    ["MetalRustyMeshFloor"]                 = {
        ["baseSketch"] = "BS_FloorRustyMesh",
    },
    ["MetalRustyMeshGrateFloor"]            = {
        ["baseSketch"] = "BS_FloorRustyMesh",
    },

    ["MetalElevatorFloor1"]                 = {
        ["category"] = "Floors_Metal",
        ["textures"] = {
            { "fixtures_escalators_01_12_sketch.png" }
        },
    },
    ["MetalElevatorFloor2"]                 = {
        ["category"] = "Floors_Metal",
        ["textures"] = {
            { "fixtures_escalators_01_5_sketch.png" }
        },
    },
    ["MetalSteelBarsFloor"]                 = {
        ["category"] = "Floors_Metal",
        ["textures"] = {
            { "industry_01_13_sketch.png" }
        },
    },
    ["MetalGreyIndustrialFloor"]            = {
        ["category"] = "Floors_Metal",
        ["textures"] = {
            { "industry_01_7_sketch.png" }
        },
    },
    ["MetalGreenIndustrialFloor"]           = {
        ["category"] = "Floors_Metal",
        ["textures"] = {
            { "industry_01_6_sketch.png" }
        },
    },

    -- Metal Stairs
    ["ElevatorStairs"]                      = {
        ["category"] = "Stairs_Metal",
        ["textures"] = {
            { "fixtures_escalators_01_2_sketch.png", "fixtures_escalators_01_1_sketch.png", "fixtures_escalators_01_0_sketch.png" }
        },
    },
    ["ModernStairs"]                        = {
        ["category"] = "Stairs_Metal",
        ["textures"] = {
            { "fixtures_stairs_01_2_sketch.png", "fixtures_stairs_01_1_sketch.png", "fixtures_stairs_01_0_sketch.png" }
        },
    },
    ["BrownMetalStairs"]                    = {
        ["category"] = "Stairs_Metal",
        ["textures"] = {
            { "fixtures_stairs_01_5_sketch.png", "fixtures_stairs_01_4_sketch.png", "fixtures_stairs_01_3_sketch.png" }
        },
    },

    -- Chairs
    ["DarkWoodenChair"]                     = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_02_1_sketch.png" }
        },
    },
    ["BlackOfficeChair"]                    = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_01_49_sketch.png" }
        },
    },
    ["GreenDinnerChair"]                    = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_01_56_sketch.png" }
        },
    },
    ["GreyChair"]                           = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_01_53_sketch.png" }
        },
    },
    ["BluePlasticChair"]                    = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_02_12_sketch.png" }
        },
    },
    ["WoodenChair"]                         = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_02_4_sketch.png" }
        },
    },
    ["FoldingChair"]                        = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_01_61_sketch.png" }
        },
    },
    ["RedWoodenChair"]                      = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_02_8_sketch.png" }
        },
    },
    ["WhiteWoodenChair"]                    = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_02_57_sketch.png" }
        },
    },

    -- Benches
    ["FancyOutdoorsBench"]                  = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_outdoor_01_9_sketch.png" },
            { "furniture_seating_outdoor_01_8_sketch.png" }
        },
    },
    ["BrickWallBench"]                      = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "location_shop_mall_01_33_sketch.png" },
            { "location_shop_mall_01_32_sketch.png" }
        },
    },
    ["TrailerFixedBench"]                   = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "location_trailer_02_1_sketch.png" },
            { "location_trailer_02_0_sketch.png" }
        },
    },
    ["SturdyBench"]                         = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_indoor_02_17_sketch.png" },
            { "furniture_seating_indoor_02_16_sketch.png" }
        },
    },
    ["ParkBench"]                           = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "furniture_seating_outdoor_01_3_sketch.png" },
            { "furniture_seating_outdoor_01_2_sketch.png" }
        },
    },
    ["ChurchPew"]                           = {
        ["category"] = "Furniture_Seating",
        ["textures"] = {
            { "location_community_church_small_01_50_sketch.png" },
            { "location_community_church_small_01_49_sketch.png" },
            { "location_community_church_small_01_48_sketch.png" }
        },
    },

    -- Garage
    ["CarLiftPillar"]                       = {
        ["category"] = "Decorations_Garage",
        ["textures"] = {
            { "location_business_machinery_01_13_sketch.png" }
        },
    },
    ["CarLiftUpperMiddlePart"]              = {
        ["category"] = "Decorations_Garage",
        ["textures"] = {
            { "location_business_machinery_01_12_sketch.png" }
        },
    },
    ["CarLiftLowerPart"]                    = {
        ["category"] = "Decorations_Garage",
        ["textures"] = {
            { "location_business_machinery_01_10_sketch.png" }
        },
    },
    ["CarLiftMiddleMiddlePart"]             = {
        ["category"] = "Decorations_Garage",
        ["textures"] = {
            { "location_business_machinery_01_4_sketch.png" }
        },
    },

    -- Metal Doors
    ["PizzaWhirledGreenMetalDoor"]          = {
        ["baseSketch"] = "BS_MetalDoor",
    },
    ["BlueMetalDoor"]                       = {
        ["baseSketch"] = "BS_MetalDoor",
    },
    ["BlackMetalDoor"]                      = {
        ["baseSketch"] = "BS_MetalDoor",
    },
    ["PileOCrepeOrangeMetalDoor"]           = {
        ["baseSketch"] = "BS_MetalDoor",
    },
    ["RedMetalDoor"]                        = {
        ["baseSketch"] = "BS_MetalDoor",
    },
    ["SpiffosRedMetalDoor"]                 = {
        ["baseSketch"] = "BS_MetalDoor",
    },


    ["MetalDoor"]      = {
        ["baseSketch"] = "BS_SimpleMetalDoor",
    },
    ["WhiteMetalDoor"] = {
        ["baseSketch"] = "BS_SimpleMetalDoor",
    },
    ["TanMetalDoor"]   = {
        ["baseSketch"] = "BS_SimpleMetalDoor",
    },
    ["SecurityDoor"]   = {
        ["category"] = "Doors_Metal",
        ["textures"] = {
            { "fixtures_doors_01_33_sketch.png" }
        },
    },


    -- Metal Doors with Windows
    ["DoubleMetalGreyRightDoor"]               = {
        ["category"] = "Doors_Metal",
        ["textures"] = {
            { "fixtures_doors_02_53_sketch.png" }
        },
    },
    ["DoubleMetalGreyLeftDoor"]                = {
        ["category"] = "Doors_Metal",
        ["textures"] = {
            { "fixtures_doors_02_49_sketch.png" }
        },
    },
    ["DoubleMetalOrangeKitchenGlassRightDoor"] = {
        ["category"] = "Doors_Metal",
        ["textures"] = {
            { "fixtures_doors_02_61_sketch.png" }
        },
    },
    ["DoubleMetalOrangeKitchenGlassLeftDoor"]  = {
        ["category"] = "Doors_Metal",
        ["textures"] = {
            { "fixtures_doors_02_57_sketch.png" }
        },
    },
    ["DoubleMetalBlackGlassRightDoor"]         = {
        ["category"] = "Doors_Metal",
        ["textures"] = {
            { "fixtures_doors_02_45_sketch.png" }
        },
    },
    ["DoubleMetalBlackGlassLeftDoor"]          = {
        ["category"] = "Doors_Metal",
        ["textures"] = {
            { "fixtures_doors_02_41_sketch.png" }
        },
    },
    ["WhiteWindowMetalDoor"]                   = {
        ["category"] = "Doors_Metal",
        ["textures"] = {
            { "fixtures_doors_01_61_sketch.png" }
        },
    },

    -- Metal Gates
    ["DoubleWroughtIronGate"]                  = {
        ["category"] = "Welding",
        ["textures"] = {
            { "fixtures_doors_fences_01_34_sketch.png", "fixtures_doors_fences_01_35_sketch.png", "fixtures_doors_fences_01_42_sketch.png", "fixtures_doors_fences_01_43_sketch.png" }
        },
    },

    -- Garage Doors
    ["3TileGreenGarageDoor"]                   = {
        ["category"] = "Doors_Garage",
        ["textures"] = {
            { "walls_garage_01_51_sketch.png", "walls_garage_01_52_sketch.png", "walls_garage_01_53_sketch.png" }
        },
    },
    ["3TileWhiteGarageDoor"]                   = {
        ["category"] = "Doors_Garage",
        ["textures"] = {
            { "walls_garage_01_3_sketch.png", "walls_garage_01_4_sketch.png", "walls_garage_01_5_sketch.png" }
        },
    },

    ["3TileRollingGarageDoor"]                 = {
        ["category"] = "Doors_Garage",
        ["textures"] = {
            { "walls_garage_02_3_sketch.png", "walls_garage_02_4_sketch.png", "walls_garage_02_5_sketch.png" }
        },
    },

    -- Garage Doors with Windows
    ["3TileRollingWindowGarageDoor"]           = {
        ["category"] = "Doors_Garage",
        ["textures"] = {
            { "walls_garage_02_51_sketch.png", "walls_garage_02_52_sketch.png", "walls_garage_02_53_sketch.png" }
        },
    },
    ["3TileRedWindowGarageDoor"]               = {
        ["category"] = "Doors_Garage",
        ["textures"] = {
            { "walls_garage_02_35_sketch.png", "walls_garage_02_36_sketch.png", "walls_garage_02_37_sketch.png" }
        },
    },

    -- Dressers
    ["SmallTableWithDrawer"]                   = {
        ["category"] = "Furniture_Dressers",
        ["textures"] = {
            { "furniture_storage_01_53_sketch.png" }
        },
    },
    ["MirrorAndDrawers"]                       = {
        ["category"] = "Furniture_Dressers",
        ["textures"] = {
            { "furniture_storage_01_42_sketch.png" }
        },
    },
    ["BedroomDrawers"]                         = {
        ["baseSketch"] = "BS_SimpleDrawers",
    },
    ["LightWoodDrawers"]                       = {
        ["baseSketch"] = "BS_SimpleDrawers",
    },
    ["FancyWhiteDrawers"]                      = {
        ["baseSketch"] = "BS_SimpleDrawers",
    },
    ["FancyOakDrawers"]                        = {
        ["baseSketch"] = "BS_SimpleDrawers",
    },
    ["FancyDarkDrawers"]                       = {
        ["baseSketch"] = "BS_SimpleDrawers",
    },


    ["FancyWhiteWardrobe"] = {
        ["baseSketch"] = "BS_LargeWardrobe",
    },
    ["FancyDarkWardrobe"]  = {
        ["baseSketch"] = "BS_LargeWardrobe",
    },
    ["LightWoodWardrobe"]  = {
        ["baseSketch"] = "BS_LargeWardrobe",
    },
    ["LargeWardrobe"]      = {
        ["baseSketch"] = "BS_LargeWardrobe",
    },
    ["FancyOakWardrobe"]   = {
        ["baseSketch"] = "BS_LargeWardrobe",
    },


    -- Windows
    ["ArchedWhiteWoodenWindow"] = {
        ["category"] = "Windows",
        ["textures"] = {
            { "fixtures_windows_01_73_sketch.png" }
        },
    },


    ["ChromeWindow"] = {
        ["baseSketch"] = "BS_SimpleWindow",
    },
    ["WhiteWindow"]  = {
        ["baseSketch"] = "BS_SimpleWindow",
    },


    ["Trailer2Window"] = {
        ["baseSketch"] = "BS_TrailerDoubleWindow",
    },
    ["Trailer1Window"] = {
        ["baseSketch"] = "BS_TrailerDoubleWindow",
    },


    ["WhiteTiledWindow"] = {
        ["baseSketch"] = "BS_TiledWindow",
    },
    ["TiledWindow"]      = {
        ["baseSketch"] = "BS_TiledWindow",
    },


    ["SliderWindow"] = {
        ["category"] = "Windows",
        ["textures"] = {
            { "fixtures_windows_01_57_sketch.png" }
        },
    },


    -- Wooden Doors
    ["WhitePanelDoor"] = {
        ["baseSketch"] = "BS_PanelDoor",
    },
    ["BrownPanelDoor"] = {
        ["baseSketch"] = "BS_PanelDoor",
    },
    ["BlackPanelDoor"] = {
        ["baseSketch"] = "BS_PanelDoor",
    },


    ["WhiteDoor"]  = {
        ["baseSketch"] = "BS_WoodenDoor",
    },
    ["BlueDoor"]   = {
        ["baseSketch"] = "BS_WoodenDoor",
    },
    ["BrownDoor"]  = {
        ["baseSketch"] = "BS_WoodenDoor",
    },
    ["CherryDoor"] = {
        ["baseSketch"] = "BS_WoodenDoor",
    },


    ["BlackDoor"] = {
        ["baseSketch"] = "BS_SmallSingleGlassPanelDoor",
    },
    ["TanDoor"]   = {
        ["baseSketch"] = "BS_SmallSingleGlassPanelDoor",
    },


    ["RoughWoodenDoor"]             = {
        ["baseSketch"] = "BS_SimpleWoodenDoor",
    },
    ["WoodenDoor"]                  = {
        ["baseSketch"] = "BS_SimpleWoodenDoor",
    },

    -- Wooden Doors with Windows
    ["FossoilBlueWindowDoor"]       = {
        ["baseSketch"] = "BS_DoubleGlassPanelDoor",
    },
    ["PizzaWhirledBrownWindowDoor"] = {
        ["baseSketch"] = "BS_DoubleGlassPanelDoor",
    },
    ["Gas2GoRedWindowDoor"]         = {
        ["baseSketch"] = "BS_DoubleGlassPanelDoor",
    },
    ["SpiffoOrangeWindowDoor"]      = {
        ["baseSketch"] = "BS_DoubleGlassPanelDoor",
    },
    ["SeaHorseBrownWindowDoor"]     = {
        ["baseSketch"] = "BS_DoubleGlassPanelDoor",
    },
    ["DoublePaneBlackDoor"]         = {
        ["baseSketch"] = "BS_DoubleGlassPanelDoor",
    },


    ["WhiteGlassSlidingDoor"] = {
        ["baseSketch"] = "BS_GlassSlidingDoor",
    },
    ["BrownGlassSlidingDoor"] = {
        ["baseSketch"] = "BS_GlassSlidingDoor",
    },


    ["SinglePaneChestnutDoor"] = {
        ["baseSketch"] = "BS_BigSingleGlassPanelDoor",
    },
    ["SinglePaneBlackDoor"]    = {
        ["baseSketch"] = "BS_BigSingleGlassPanelDoor",
    },


    ["WhiteWindowDoor"]          = {
        ["baseSketch"] = "BS_SingleGlassPanelDoor",
    },
    ["BrownWindowDoor"]          = {
        ["baseSketch"] = "BS_SingleGlassPanelDoor",
    },
    ["PileOCrepeBlueWindowDoor"] = {
        ["baseSketch"] = "BS_SingleGlassPanelDoor",
    },
}

return {
    Sketches = Sketches,
    BaseSketches = BaseSketches,
    Chapters = Chapters
}
