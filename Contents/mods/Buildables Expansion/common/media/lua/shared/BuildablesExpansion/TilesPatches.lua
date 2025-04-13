local Utils = require("BuildablesExpansion/Utils")

Events.OnInitWorld.Add(function()
    Utils.addValuesToPropertyMap("ContainerCapacity", {
        "100"
    });
end);

Events.OnLoadedTileDefinitions.Add(function(manager)
    -- grouped sprite operations to reuse local variables
    Utils.setOrUnsetSpriteProperties(manager, {
        "location_military_generic_01_0",
        "location_military_generic_01_1",
        "location_military_generic_01_2",
        "location_military_generic_01_3",
        "location_military_generic_01_4",
        "location_military_generic_01_5",

        "location_military_generic_01_8",
        "location_military_generic_01_9",
        "location_military_generic_01_10",
        "location_military_generic_01_11",
        "location_military_generic_01_12",
        "location_military_generic_01_13",
    }, {
        { "ContainerCapacity", "100", false }
    });
end)
