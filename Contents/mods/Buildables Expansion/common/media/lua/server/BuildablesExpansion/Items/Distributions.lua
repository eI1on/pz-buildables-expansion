local proceduralDistributions = ProceduralDistributions.list;
local tableInsert = table.insert;

local function processAndInsertItems(itemDistributions)
    for item, distributions in pairs(itemDistributions) do
        for i = 1, #distributions, 2 do
            local distributionName = distributions[i];
            local chance = distributions[i + 1];

            local distributionList = proceduralDistributions[distributionName].items;

            tableInsert(distributionList, item);
            tableInsert(distributionList, chance);
        end
    end
end

local itemDistributions = {
    ["Base.RefrigeratorCompressor"] = {
        "ArmyHangarMechanics", 0.25,
        "ArmyStorageElectronics", 0.25,
        "ConstructionWorkerTools", 0.15,
        "CrateBlacksmithing", 0.25,
        "CrateElectronics", 0.5,
        "GarageMetalwork", 1,
        "CrateMechanics", 0.25,
        "CrateMetalwork", 0.25,
        "CrateRandomJunk", 0.0001,
        "ElectronicStoreMisc", 0.25,
        "GarageMechanics", 0.25,
        "GeneratorRoom", 0.25,
        "MechanicShelfElectric", 0.75,
        "MechanicSpecial", 0.25,
        "ToolCabinetMechanics", 0.25,
        "ToolStoreMetalwork", 0.75,
        "ToolStoreTools", 0.25,
        "WeldingWorkshopTools", 0.25,
        "WireFactoryTools", 0.25,
    },

    ["Base.RefrigerantBottle"] = {
        "ArmyHangarMechanics", 1,
        "ArmyHangarTools", 1,
        "ConstructionWorkerTools", 0.5,
        "CrateMetalwork", 0.5,
        "GarageMetalwork", 5,
        "GeneratorRoom", 2,
        "MetalShopTools", 3,
        "WireFactoryTools", 2,
        "EngineerTools", 1,
        "CrateElectronics", 2,
        "MetalWorkerTools", 5,
        "ToolStoreMetalwork", 1,
        "ArmyStorageElectronics", 0.75,
        "WeldingWorkshopFuel", 5,
        "CrateRandomJunk", 0.001,
        "ElectronicStoreMisc", 0.75,
        "GarageMechanics", 0.5,
        "MechanicShelfElectric", 1,
        "MechanicSpecial", 1,
        "ToolCabinetMechanics", 1,
        "ToolStoreTools", 1,
        "WeldingWorkshopTools", 1,
    },

    ["Base.PlasticSheet"] = {
        "CrateMetalwork", 2,
        "CrateRandomJunk", 0.5,
        "GarageMetalwork", 5,
        "JunkBin", 4,
        "ToolStoreMetalwork", 4,
        "CrateSheetMetal", 5,
        "JunkBin", 2.5,
        "WeldingWorkshopMetal", 2.5,
        "WeldingWorkshopTools", 2.5
    },

    ["Base.PlasticSheetSmall"] = {
        "CrateMetalwork", 2,
        "CrateRandomJunk", 0.5,
        "GarageMetalwork", 5,
        "JunkBin", 4,
        "ToolStoreMetalwork", 4,
        "CrateSheetMetal", 5,
        "JunkBin", 2.5,
        "WeldingWorkshopMetal", 2.5,
        "WeldingWorkshopTools", 2.5
    },

    ["Base.InsulationFoam"] = {
        "CrateMetalwork", 2,
        "CrateRandomJunk", 0.5,
        "GarageMetalwork", 5,
        "JunkBin", 4,
        "ToolStoreMetalwork", 4,
        "CrateSheetMetal", 5,
        "JunkBin", 2.5,
        "WeldingWorkshopMetal", 2.5,
        "WeldingWorkshopTools", 2.5
    },

    ["Base.SmallRubberTube"] = {
        "CrateMetalwork", 2,
        "CrateRandomJunk", 0.5,
        "GarageMetalwork", 5,
        "JunkBin", 4,
        "ToolStoreMetalwork", 4,
        "CrateSheetMetal", 5,
        "JunkBin", 2.5,
        "WeldingWorkshopMetal", 2.5,
        "WeldingWorkshopTools", 2.5
    },

    ["Base.RubberSeal"] = {
        "CrateMetalwork", 2,
        "CrateRandomJunk", 0.5,
        "GarageMetalwork", 5,
        "JunkBin", 4,
        "ToolStoreMetalwork", 4,
        "CrateSheetMetal", 5,
        "JunkBin", 2.5,
        "WeldingWorkshopMetal", 2.5,
        "WeldingWorkshopTools", 2.5,
        "ElectronicStoreMisc", 1,
        "MechanicShelfElectric", 1,
        "ToolCabinetMechanics", 0.5,
    },

    ["Base.ThinCopperPipe"] = {
        "CabinetFactoryTools", 2,
        "JunkBin", 2,
        "CrateMetalwork", 5,
        "CrateRandomJunk", 0.3,
        "DerelictHouseCrime", 0.05,
        "GarageMetalwork", 2.5,
        "MeleeWeapons", 2.5,
        "MeleeWeapons_Mid", 2.5,
        "MeleeWeapons_Late", 2.5,
        "ToolStoreMetalwork", 5,
        "WeldingWorkshopMetal", 5,
        "DrugShackWeapons", 2,
    },

    ["Base.AsphaltMixturePowder"] = {
        "CratePlaster", 25,
        "CratePlaster", 10,
        "CratePlaster", 10,
        "CratePlaster", 5,
        "CratePlaster", 5,
        "CrateWallFinish", 4,
        "CrateWallFinish", 4,
        "ToolStoreMisc", 5,
        "ConstructionWorkerTools", 1,
        "GarageCarpentry", 2,
        "GarageMechanics", 1,
        "GarageMetalwork", 0.5,
        "GarageTools", 0.5,
        "CrateCarpentry", 1,
        "CrateMechanics", 0.5,
        "CrateMetalwork", 0.5,
        "CratePlaster", 4,
        "CrateConcrete", 4,
        "CrateRandomJunk", 0.5,
        "ToolStoreCarpentry", 1.5,
        "ToolStoreMetalwork", 1,
        "ToolStoreTools", 0.5,
    },
};

processAndInsertItems(itemDistributions);


local function findItemLocations(itemName)
    for distributionName, distributionData in pairs(ProceduralDistributions.list) do
        if distributionData.items then
            for i = 1, #distributionData.items, 2 do
                if distributionData.items[i] == itemName then
                    print(distributionName .. " - Spawn Rate: " .. distributionData.items[i + 1])
                end
            end
        end
    end
end
print("=====================")
findItemLocations("PlasterPowder")
print("=====================")
