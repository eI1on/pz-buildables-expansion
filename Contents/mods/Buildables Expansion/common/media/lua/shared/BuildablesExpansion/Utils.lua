local Logger = require("BuildablesExpansion/Logger")

---@class Utils
local Utils = {}

--- Sets a sprite property
---@param props PropertyContainer The properties object of the sprite
---@param propertyName string|IsoFlagType The name of the property to set or an IsoFlagType
---@param propertyValue string|nil The value to set the property to
---@param checkIsoFlagType boolean|nil Additional flag to indicate if IsoFlagType should be checked
function Utils.setSpriteProperty(props, propertyName, propertyValue, checkIsoFlagType)
    if type(propertyName) == "userdata" and propertyValue == nil then
        ---@diagnostic disable-next-line: param-type-mismatch
        props:Set(propertyName)
    elseif type(propertyName) == "string" and type(propertyValue) == "string" then
        if checkIsoFlagType == nil then
            props:Set(propertyName, propertyValue)
        else
            props:Set(propertyName, propertyValue, checkIsoFlagType)
        end
    elseif type(propertyName) == "userdata" and type(propertyValue) == "string" then
        ---@diagnostic disable-next-line: param-type-mismatch
        props:Set(propertyName, propertyValue)
    else
        Logger:error("Invalid parameter types or count for Set function")
        Logger:error((propertyName or "nil") .. " " .. (propertyValue or "nil") .. " " .. (checkIsoFlagType or "nil"))
    end
end

--- Unsets a sprite property
---@param props PropertyContainer The properties object of the sprite
---@param propertyName string|IsoFlagType The name of the property to unset or an IsoFlagType
function Utils.unsetSpriteProperty(props, propertyName)
    if type(propertyName) == "string" then
        props:UnSet(propertyName)
    elseif type(propertyName) == "userdata" then
        ---@diagnostic disable-next-line: param-type-mismatch
        props:UnSet(propertyName)
    else
        Logger:error("Invalid parameter type for UnSet function")
        ---@diagnostic disable-next-line: param-type-mismatch
        Logger:error((propertyName or "nil"))
    end
end

--- Function to set or unset sprite properties
---@param manager IsoSpriteManager The sprite manager
---@param spriteList table The list of sprite names
---@param setProperties table|nil A list of properties to set
---@param unsetProperties table|nil A list of properties to unset
function Utils.setOrUnsetSpriteProperties(manager, spriteList, setProperties, unsetProperties)
    local props
    for _, sprite in ipairs(spriteList) do
        props = manager:getSprite(sprite):getProperties()
        -- set properties
        if setProperties then
            for _, prop in ipairs(setProperties) do
                Utils.setSpriteProperty(props, unpack(prop))
            end
        end
        -- unset properties
        if unsetProperties then
            for _, prop in ipairs(unsetProperties) do
                Utils.unsetSpriteProperty(props, prop)
            end
        end
        props:CreateKeySet()
    end
end

--- Prints property names and their values, as well as flags list for a sprite
---@param sprite string The sprite name
function Utils.printPropNamesFromSprite(sprite)
    local isoSprite = IsoSpriteManager.instance:getSprite(sprite)
    if not isoSprite then
        Logger:debug("No properties for " .. sprite) return
    end

    local props = isoSprite:getProperties()

    local propertyNames = props:getPropertyNames()
    if propertyNames and propertyNames:size() > 0 then
        Logger:debug("Property Names and Values for " .. sprite .. ":")
        for i = 0, propertyNames:size() - 1 do
            local propName = propertyNames:get(i)
            local propValue = props:Val(propName) or "nil"
            Logger:debug(string.format("    %s = %s", propName, propValue))
        end
    else
        Logger:debug("No property names for " .. sprite)
    end

    local flagsList = props:getFlagsList()
    if flagsList and flagsList:size() > 0 then
        Logger:debug("Flags List for " .. sprite .. ":")
        for i = 0, flagsList:size() - 1 do
            local flag = flagsList:get(i)
            Logger:debug("    " .. tostring(flag))
        end
    else
        Logger:debug("No flags for " .. sprite)
    end
end

-- Function to add a list of values to a specified property in the world's property value map
---@param propertyName string The name of the property to which values are added
---@param values table A table of values to ensure they are present in the property map
function Utils.addValuesToPropertyMap(propertyName, values)
    local currentValues = IsoWorld.PropertyValueMap:get(propertyName) or ArrayList.new()

    for _, value in ipairs(values) do
        if not currentValues:contains(value) then
            currentValues:add(value)
        end
    end

    IsoWorld.PropertyValueMap:put(propertyName, currentValues)
end

function Utils.buildDisplayNameMap()
    local displayNameMap = {}
    local infos = SpriteConfigManager.GetObjectInfoList()

    for i = 0, infos:size() - 1 do
        local info = infos:get(i)
        if info:getScript() and info:getRecipe() then
            local gameEntityScript = info:getScript():getParent()
            local scriptName = gameEntityScript:getName()

            local displayName = getText("EC_Entity_DisplayName_Default")
            local uiConfig = gameEntityScript:getComponentScriptFor(ComponentType.UiConfig)

            if uiConfig then
                local skinName = uiConfig:getXuiSkinName()
                local entityStyle = uiConfig:getEntityStyle()

                local skin = XuiManager.GetSkin(skinName) or XuiManager.GetDefaultSkin()
                if skin then
                    local style = skin:getEntityUiStyle(entityStyle)
                    if style and style:getDisplayName() then
                        displayName = style:getDisplayName()
                    end
                end
            end

            displayNameMap[scriptName] = displayName
        end
    end

    return displayNameMap
end

return Utils
