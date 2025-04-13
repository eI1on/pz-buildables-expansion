local Logger = require("ElyonLib/Core/Logger"):new("Buildables Expansion", "0.0.1")
local Utils = require("BuildablesExpansion/Utils")

local SketchDatabase = require("BuildablesExpansion/SketchDatabase")
local BaseSketches = SketchDatabase.BaseSketches
local Sketches = SketchDatabase.Sketches
local Chapters = SketchDatabase.Chapters

local SketchBookUI = ISPanel:derive("SketchBookUI")

local CONST = {
    BOOK_WIDTH = 1000 * 1.2,
    BOOK_HEIGHT = 700 * 1.2,
    PADDING = 40,
    BUTTON_WIDTH = 30,
    BUTTON_HEIGHT = 30,
    FONT = {
        TITLE = UIFont.Handwritten,
        CHAPTER = UIFont.Handwritten,
        CATEGORY = UIFont.Handwritten,
        SKETCH = UIFont.Handwritten
    },
    COLORS = {
        TEXT = { r = 0, g = 0, b = 0, a = 0.75 },
        HOVER = { r = 1, g = 0.8, b = 0, a = 1 }
    },
    SKETCH_HEIGHT = 128,
    SKETCH_WIDTH = 64,
    SKETCH_SPACING = 30
}


local toRomanNumeral
do
    local romanCache = {}
    local map = {
        { 1000, "M" }, { 900, "CM" }, { 500, "D" }, { 400, "CD" },
        { 100,  "C" }, { 90, "XC" }, { 50, "L" }, { 40, "XL" },
        { 10, "X" }, { 9, "IX" }, { 5, "V" }, { 4, "IV" }, { 1, "I" }
    }
    toRomanNumeral = function(n)
        if romanCache[n] then return romanCache[n] end
        local result = ""
        for i = 1, #map do
            local pair = map[i]
            while n >= pair[1] do
                result = result .. pair[2]
                n = n - pair[1]
            end
        end
        romanCache[n] = result
        return result
    end
end


---@param x number
---@param y number
---@param sketchbook InventoryItem
---@param player IsoPlayer
---@return ISPanel
function SketchBookUI:new(x, y, sketchbook, player)
    local o = ISPanel:new(x, y, CONST.BOOK_WIDTH, CONST.BOOK_HEIGHT)
    setmetatable(o, self)
    self.__index = self

    o.backgroundColor = { r = 0, g = 0, b = 0, a = 0 }
    o.borderColor = { r = 0, g = 0, b = 0, a = 0 }
    o.sketchbookTex = getTexture("media/ui/sketch_book.png")
    o.frontpageTex = getTexture("media/ui/sketch_front_page.png")
    o.moveWithMouse = true
    o.player = player
    o.currentSpread = 1
    o.sketchbook = sketchbook
    o.knownSketches = sketchbook:getModData()["BuildersSketches"] or {}
    o.mouseOverCategory = nil

    o.displayNameMap = Utils.buildDisplayNameMap()

    o:buildContentStructure()
    o:createNavigationButtons()

    o:setWantKeyEvents(true)

    return o
end

function SketchBookUI:getChapterForCategory(category)
    for chapterName, categories in pairs(Chapters) do
        if categories[category] then return chapterName end
    end
    return "Other"
end

function SketchBookUI:getOrderedChapters()
    return self.chapterOrder or {}
end

function SketchBookUI:buildContentStructure()
    self.allSketches = {}
    for entityName, _ in pairs(self.knownSketches) do
        local sketchData = nil
        local baseSketchID = nil
        if Sketches[entityName] and Sketches[entityName]["baseSketch"] then
            sketchData = BaseSketches[Sketches[entityName]["baseSketch"]]
            baseSketchID = Sketches[entityName]["baseSketch"]
        elseif Sketches[entityName] then
            sketchData = Sketches[entityName]
        end
        if sketchData then
            self.allSketches[entityName] = {
                sketchID = entityName,
                baseSketchID = baseSketchID,
                data = sketchData
            }
        end
    end

    self.chapters = {}

    for chapterName, categoryTable in pairs(Chapters) do
        self.chapters[chapterName] = {}
    end

    local otherUsed = false

    for _, sketch in pairs(self.allSketches) do
        local category = sketch.data.category
        local chapterName = self:getChapterForCategory(category)

        if not self.chapters[chapterName] then
            self.chapters[chapterName] = {}
        end

        self.chapters[chapterName][category] = true

        if chapterName == "Other" then
            otherUsed = true
        end
    end

    self.chapterOrder = table.newarray() --[[@as table]]
    for chapterName, _ in pairs(Chapters) do
        local hasAny = false
        for _, _ in pairs(self.chapters[chapterName]) do
            hasAny = true
            break
        end
        if hasAny then
            table.insert(self.chapterOrder, chapterName)
        end
    end

    if otherUsed then
        table.insert(self.chapterOrder, "Other")
    end

    self.tocSpreads = {}
    local left = {}
    local right = {}
    local currentYLeft = CONST.PADDING
    local currentYRight = CONST.PADDING
    local maxHeight = CONST.BOOK_HEIGHT - CONST.PADDING * 2

    for _, chapterName in ipairs(self:getOrderedChapters()) do
        if self.chapters[chapterName] then
            local categories = self:getOrderedCategories(chapterName)

            local neededHeight = getTextManager():getFontHeight(CONST.FONT.CHAPTER) +
                (#categories * getTextManager():getFontHeight(CONST.FONT.CATEGORY)) + 20

            if currentYLeft + neededHeight <= maxHeight then
                table.insert(left, {
                    chapter = chapterName,
                    categories = categories,
                    yStart = currentYLeft
                })
                currentYLeft = currentYLeft + neededHeight
            elseif currentYRight + neededHeight <= maxHeight then
                table.insert(right, {
                    chapter = chapterName,
                    categories = categories,
                    yStart = currentYRight
                })
                currentYRight = currentYRight + neededHeight
            else
                table.insert(self.tocSpreads, { left = left, right = right })
                left = {}
                right = {}
                currentYLeft = CONST.PADDING
                currentYRight = CONST.PADDING
                table.insert(left, {
                    chapter = chapterName,
                    categories = categories,
                    yStart = currentYLeft
                })
                currentYLeft = currentYLeft + neededHeight
            end
        end
    end

    if #left > 0 or #right > 0 then
        table.insert(self.tocSpreads, { left = left, right = right })
    end

    self.categoryPages = {}
    for _, chapterName in ipairs(self:getOrderedChapters()) do
        if self.chapters[chapterName] then
            for _, categoryName in ipairs(self:getOrderedCategories(chapterName)) do
                local sketches = self:getSketchesForCategory(categoryName)
                local baseGroups = {}
                local regularMultiTile = {}
                local regularSingleTile = {}

                for _, sketch in ipairs(sketches) do
                    local textures = sketch.data.textures
                    if sketch.baseSketchID then
                        local baseID = sketch.baseSketchID
                        if not baseGroups[baseID] then
                            baseGroups[baseID] = {
                                baseSketchID = baseID,
                                baseData = BaseSketches[baseID],
                                variants = {}
                            }
                        end
                        table.insert(baseGroups[baseID].variants, sketch)
                    else
                        if #textures > 1 or #textures[1] > 1 then
                            table.insert(regularMultiTile, sketch)
                        else
                            table.insert(regularSingleTile, sketch)
                        end
                    end
                end

                for baseID, group in pairs(baseGroups) do
                    table.insert(self.categoryPages, {
                        chapter = chapterName,
                        name = categoryName,
                        type = "base",
                        baseSketchID = baseID,
                        baseData = group.baseData,
                        variants = group.variants
                    })
                end

                for _, sketch in ipairs(regularMultiTile) do
                    table.insert(self.categoryPages, {
                        chapter = chapterName,
                        name = categoryName,
                        type = "regular",
                        sketches = { sketch }
                    })
                end

                for i = 1, #regularSingleTile, 2 do
                    local pageSketches = {}
                    for j = i, math.min(i + 1, #regularSingleTile) do
                        table.insert(pageSketches, regularSingleTile[j])
                    end
                    table.insert(self.categoryPages, {
                        chapter = chapterName,
                        name = categoryName,
                        type = "regular",
                        sketches = pageSketches
                    })
                end
            end
        end
    end
end

function SketchBookUI:getOrderedCategories(chapterName)
    local categories = {}
    local chapterCategories = Chapters[chapterName]

    if type(chapterCategories) ~= "table" then
        return categories
    end

    for catName in pairs(chapterCategories) do
        if self.chapters[chapterName][catName] then
            table.insert(categories, catName)
        end
    end

    table.sort(categories)
    return categories
end

function SketchBookUI:getSketchesForCategory(targetCategory)
    local sketches = {}
    for _, sketch in pairs(self.allSketches) do
        if sketch.data.category == targetCategory then
            table.insert(sketches, sketch)
        end
    end
    return sketches
end

function SketchBookUI:createNavigationButtons()
    local buttonY = CONST.BOOK_HEIGHT - CONST.BUTTON_HEIGHT - CONST.PADDING

    self.closeButton = ISButton:new(
        CONST.BOOK_WIDTH - CONST.BUTTON_WIDTH - CONST.PADDING,
        CONST.PADDING,
        CONST.BUTTON_WIDTH,
        CONST.BUTTON_HEIGHT,
        "X", self, self.onClick
    )
    self.closeButton.internal = "CLOSE"
    self.closeButton.borderColor = { r = 0, g = 0, b = 0, a = 0 }
    self.closeButton.backgroundColor = { r = 0, g = 0, b = 0, a = 0 }

    self.closeButton.backgroundColorMouseOver = { r = 0, g = 0, b = 0, a = 0 }
    self.closeButton.textureColor = { r = 0, g = 0, b = 0, a = 0 }
    self.closeButton.textColor = {
        r = CONST.COLORS.TEXT.r,
        g = CONST.COLORS.TEXT.g,
        b = CONST.COLORS.TEXT.b,
        a = CONST.COLORS.TEXT.a
    }

    self.closeButton:setFont(CONST.FONT.CATEGORY)
    self.closeButton:initialise()
    self.closeButton:instantiate()
    self:addChild(self.closeButton)

    self.prevButton = ISButton:new(
        CONST.PADDING,
        buttonY,
        CONST.BUTTON_WIDTH,
        CONST.BUTTON_HEIGHT,
        "<", self, self.onClick
    )
    self.prevButton.internal = "PREV"
    self.prevButton.borderColor = { r = 0, g = 0, b = 0, a = 0 }
    self.prevButton.backgroundColor = { r = 0, g = 0, b = 0, a = 0 }

    self.prevButton.backgroundColorMouseOver = { r = 0, g = 0, b = 0, a = 0 }
    self.prevButton.textureColor = { r = 0, g = 0, b = 0, a = 0 }
    self.prevButton.textColor = {
        r = CONST.COLORS.TEXT.r,
        g = CONST.COLORS.TEXT.g,
        b = CONST.COLORS.TEXT.b,
        a = CONST.COLORS.TEXT.a
    }

    self.prevButton:setFont(CONST.FONT.CATEGORY)
    self.prevButton:initialise()
    self.prevButton:instantiate()
    self:addChild(self.prevButton)

    self.nextButton = ISButton:new(
        CONST.BOOK_WIDTH - CONST.BUTTON_WIDTH - CONST.PADDING,
        buttonY,
        CONST.BUTTON_WIDTH,
        CONST.BUTTON_HEIGHT,
        ">", self, self.onClick
    )
    self.nextButton.internal = "NEXT"
    self.nextButton.borderColor = { r = 0, g = 0, b = 0, a = 0 }
    self.nextButton.backgroundColor = { r = 0, g = 0, b = 0, a = 0 }

    self.nextButton.backgroundColorMouseOver = { r = 0, g = 0, b = 0, a = 0 }
    self.nextButton.textureColor = { r = 0, g = 0, b = 0, a = 0 }
    self.nextButton.textColor = {
        r = CONST.COLORS.TEXT.r,
        g = CONST.COLORS.TEXT.g,
        b = CONST.COLORS.TEXT.b,
        a = CONST.COLORS.TEXT.a
    }

    self.nextButton:setFont(CONST.FONT.CATEGORY)
    self.nextButton:initialise()
    self.nextButton:instantiate()
    self:addChild(self.nextButton)

    self:updateNavigationButtons()
end

function SketchBookUI:updateNavigationButtons()
    self.prevButton:setVisible(self.currentSpread > 1)
    local maxSpread = 1 + #self.tocSpreads + math.ceil(#self.categoryPages / 2)
    self.nextButton:setVisible(self.currentSpread < maxSpread)
end

function SketchBookUI:prerender()
    ISPanel.prerender(self)
    self:drawTextureScaled(self.sketchbookTex, 0, 0, self.width, self.height, 1, 1, 1, 1)
end

function SketchBookUI:render()
    ISPanel.render(self)
    if self.currentSpread == 1 then
        self:renderTitlePage()
    else
        local tocSpreadIndex = self.currentSpread - 1
        if tocSpreadIndex <= #self.tocSpreads then
            local spread = self.tocSpreads[tocSpreadIndex]
            local hasLeft = #spread.left > 0
            local hasRight = #spread.right > 0
            if hasLeft or hasRight then
                self:renderTocPage(spread.left, 0)
                self:renderTocPage(spread.right, CONST.BOOK_WIDTH / 2)
            end
        else
            local categorySpreadIndex = tocSpreadIndex - #self.tocSpreads
            local leftIndex = (categorySpreadIndex - 1) * 2 + 1
            local rightIndex = leftIndex + 1
            self:renderCategoryPage(leftIndex, 0)
            self:renderCategoryPage(rightIndex, CONST.BOOK_WIDTH / 2)
        end
    end
end

function SketchBookUI:renderTitlePage()
    local title = getText("IGUI_Builders_Sketchbook")
    local pageWidth = CONST.BOOK_WIDTH / 2
    local zoom = 1.25
    local font = CONST.FONT.TITLE

    local titleX = pageWidth + (pageWidth - getTextManager():MeasureStringX(font, title) * zoom) / 2
    local titleY = CONST.BOOK_HEIGHT * 0.2

    self:drawTextZoomed(title, titleX, titleY, zoom, CONST.COLORS.TEXT.r, CONST.COLORS.TEXT.g, CONST.COLORS.TEXT.b, CONST.COLORS.TEXT.a, font)

    if self.frontpageTex then
        local texWidth = self.frontpageTex:getWidth()
        local texHeight = self.frontpageTex:getHeight()

        local sketchX = pageWidth + (pageWidth - texWidth) / 2
        local sketchY = titleY + 100

        self:drawTextureScaled(self.frontpageTex, sketchX, sketchY, texWidth, texHeight, 1, 1, 1, 1)
    end
end

function SketchBookUI:renderTocPage(pageEntries, xOffset)
    if not pageEntries then return end
    local pageWidth = CONST.BOOK_WIDTH / 2
    for _, entry in ipairs(pageEntries) do
        local y = entry.yStart
        local chapterIndex = 1
        for i = 1, #self.chapterOrder do
            local name = self.chapterOrder[i]
            if name == entry.chapter then
                chapterIndex = i
                break
            end
        end
        local roman = toRomanNumeral(chapterIndex)
        local chapterTitle = getText("IGUI_Sketchbook_Chapter", roman,
            getText("IGUI_Sketchbook_Chapter_" .. entry.chapter))
        self:drawCenteredText(CONST.FONT.CHAPTER, chapterTitle, xOffset, pageWidth, y, CONST.COLORS.TEXT)
        y = y + getTextManager():getFontHeight(CONST.FONT.CHAPTER)
        for _, category in ipairs(entry.categories) do
            local color = self.mouseOverCategory == category and CONST.COLORS.HOVER or CONST.COLORS.TEXT
            self:drawText(getText("IGUI_Sketchbook_Category_" .. category), xOffset + CONST.PADDING + 20, y, color.r,
                color.g, color.b, color.a, CONST.FONT.CATEGORY)
            y = y + getTextManager():getFontHeight(CONST.FONT.CATEGORY)
        end
    end
end

function SketchBookUI:drawCenteredText(font, text, xOffset, width, y, color)
    local textWidth = getTextManager():MeasureStringX(font, text)
    local x = xOffset + (width - textWidth) / 2
    self:drawText(text, x, y, color.r, color.g, color.b, color.a, font)
end

function SketchBookUI:renderCategoryPage(pageIndex, xOffset)
    local page = self.categoryPages[pageIndex]
    if not page then return end

    local pageWidth = CONST.BOOK_WIDTH / 2
    local pageHeight = CONST.BOOK_HEIGHT
    local pageLeft = xOffset + CONST.PADDING
    local pageBottom = CONST.BOOK_HEIGHT - CONST.PADDING
    local y = CONST.PADDING
    local isFirstPageOfChapter = self:isFirstPageOfChapter(pageIndex)
    local isFirstPageOfCategory = self:isFirstPageOfCategory(pageIndex)

    if isFirstPageOfChapter and page.chapter then
        local chapterIndex = 1
        for i = 1, #self.chapterOrder do
            local name = self.chapterOrder[i]
            if name == page.chapter then
                chapterIndex = i
                break
            end
        end
        local roman = toRomanNumeral(chapterIndex)
        local chapterTitle = getText("IGUI_Sketchbook_Chapter", roman,
            getText("IGUI_Sketchbook_Chapter_" .. page.chapter))
        self:drawCenteredText(CONST.FONT.CHAPTER, chapterTitle, xOffset, pageWidth, y, CONST.COLORS.TEXT)
        y = y + getTextManager():getFontHeight(CONST.FONT.CHAPTER) + 10
    end

    if isFirstPageOfCategory and page.name then
        self:drawCenteredText(CONST.FONT.CATEGORY, getText("IGUI_Sketchbook_Category_" .. page.name), xOffset, pageWidth,
            y, CONST.COLORS.TEXT)
        y = y + getTextManager():getFontHeight(CONST.FONT.CATEGORY) + 20
    end

    if page.type == "base" then
        local lineHeight = getTextManager():getFontHeight(CONST.FONT.SKETCH)

        for i, variant in ipairs(page.variants) do
            local lineY = y + (i - 1) * lineHeight
            local name = self.displayNameMap[variant.sketchID] or variant.sketchID
            self:drawText(name, pageLeft, lineY,
                CONST.COLORS.TEXT.r, CONST.COLORS.TEXT.g, CONST.COLORS.TEXT.b,
                CONST.COLORS.TEXT.a, CONST.FONT.SKETCH)
        end

        y = y + #page.variants * lineHeight + 10

        local baseTexturePath = "media/ui/Sketches/" .. page.name .. "/" .. page.baseSketchID .. "/"
        self:renderMultiTileTexture(page.baseData.textures, baseTexturePath, xOffset, y, pageWidth, pageHeight)
    else
        local rendered = 0
        for i, sketch in ipairs(page.sketches) do
            local textures = sketch.data.textures
            local isMultiTile = #textures > 1 or (#textures[1] > 1)
            if isMultiTile and rendered > 0 then
                break
            end

            local sampleTexture = getTexture("media/ui/Sketches/" ..
                page.name .. "/" .. (sketch.baseSketchID or sketch.sketchID) .. "/" .. textures[1][1])
            local sketchHeight = sampleTexture and sampleTexture:getHeight() or CONST.SKETCH_HEIGHT

            if isMultiTile and #textures > 1 then
                sketchHeight = sketchHeight * 1.25
            end

            if y + getTextManager():getFontHeight(CONST.FONT.SKETCH) + sketchHeight + 20 > pageBottom then
                break
            end

            rendered = rendered + 1
            if rendered > 2 then break end

            local name = self.displayNameMap[sketch.sketchID] or sketch.sketchID
            self:drawText(name, pageLeft, y,
                CONST.COLORS.TEXT.r, CONST.COLORS.TEXT.g, CONST.COLORS.TEXT.b,
                CONST.COLORS.TEXT.a, CONST.FONT.SKETCH)

            y = y + getTextManager():getFontHeight(CONST.FONT.SKETCH) + 10

            local texturePath = "media/ui/Sketches/" ..
                page.name .. "/" .. (sketch.baseSketchID or sketch.sketchID) .. "/"

            self:renderMultiTileTexture(sketch.data.textures, texturePath, xOffset, y, pageWidth, pageHeight)

            if isMultiTile then
                y = y + sketchHeight + 30
            else
                y = y + sketchHeight + 20
            end
        end
    end
end

function SketchBookUI:renderMultiTileTexture(texturesTable, basePath, xOffset, yPos, pageWidth, pageHeight)
    local isMultiTile = false
    local rowCount = #texturesTable
    local colCount = 0

    if rowCount > 0 then
        colCount = #texturesTable[1]
        isMultiTile = (rowCount > 1 or colCount > 1)
    end

    local padding = CONST.PADDING
    local pageLeft = xOffset + padding
    local pageRight = xOffset + pageWidth - padding

    local centerX = xOffset + (pageWidth / 2)

    if isMultiTile then
        local sampleTexture = getTexture(basePath .. texturesTable[1][1])
        if not sampleTexture then return end

        local tileWidth = sampleTexture:getWidth()
        local tileHeight = sampleTexture:getHeight()

        local isoOffsetX = tileWidth / 2
        local isoOffsetY = tileHeight / 8

        local totalGridWidth = (colCount + rowCount - 1) * isoOffsetX
        local totalGridHeight = (colCount + rowCount - 1) * isoOffsetY + tileHeight

        local startX = centerX - (totalGridWidth / 2)

        if startX < pageLeft then startX = pageLeft end
        if startX + totalGridWidth > pageRight then startX = pageRight - totalGridWidth end

        local startY = yPos

        for rowIdx = rowCount, 1, -1 do
            for colIdx = 1, #texturesTable[rowIdx] do
                local textureName = texturesTable[rowIdx][colIdx]
                local texture = getTexture(basePath .. textureName)
                if texture then
                    local tileX = startX + (colIdx - 1) * isoOffsetX - (rowIdx - 1) * isoOffsetX
                    local tileY = startY + (colIdx - 1) * isoOffsetY + (rowIdx - 1) * isoOffsetY
                    self:drawTexture(texture, tileX, tileY, 1, 1, 1, 1)
                end
            end
        end
    else
        local texture = getTexture(basePath .. texturesTable[1][1])
        if texture then
            local tileWidth = texture:getWidth()
            local tileHeight = texture:getHeight()

            local adjustedX = centerX - (tileWidth / 2)
            local adjustedY = yPos

            if adjustedX < pageLeft then adjustedX = pageLeft end
            if adjustedX + tileWidth > pageRight then adjustedX = pageRight - tileWidth end

            if (adjustedY + tileHeight) > pageHeight then
                adjustedY = (pageHeight - tileHeight) / 2
                adjustedX = pageRight - tileWidth
            end

            self:drawTexture(texture, adjustedX, adjustedY, 1, 1, 1, 1)
        end
    end
end

function SketchBookUI:isFirstPageOfChapter(pageIndex)
    if pageIndex <= 0 or pageIndex > #self.categoryPages then return false end
    local page = self.categoryPages[pageIndex]
    if pageIndex == 1 then return true end
    local prevPage = self.categoryPages[pageIndex - 1]
    return prevPage.chapter ~= page.chapter
end

function SketchBookUI:isFirstPageOfCategory(pageIndex)
    if pageIndex <= 0 or pageIndex > #self.categoryPages then return false end
    local page = self.categoryPages[pageIndex]
    if pageIndex == 1 then return true end
    local prevPage = self.categoryPages[pageIndex - 1]
    return prevPage.name ~= page.name or prevPage.chapter ~= page.chapter
end

function SketchBookUI:onMouseMove(dx, dy)
    ISPanel.onMouseMove(self, dx, dy)
    self.mouseOverCategory = nil

    local tocSpreadIndex = self.currentSpread - 1
    if tocSpreadIndex >= 1 and tocSpreadIndex <= #self.tocSpreads then
        local mouseX = self:getMouseX()
        local mouseY = self:getMouseY()
        self.mouseOverCategory = self:getCategoryAtPosition(mouseX, mouseY)
    end
end

function SketchBookUI:onMouseUp(x, y)
    ISPanel.onMouseUp(self, x, y)

    local tocSpreadIndex = self.currentSpread - 1
    if tocSpreadIndex >= 1 and tocSpreadIndex <= #self.tocSpreads then
        local category = self:getCategoryAtPosition(x, y)
        if category then
            self:jumpToCategory(category)
        end
    end
end

function SketchBookUI:onMouseDown(x, y)
    ISPanel.onMouseDown(self, x, y)
end

function SketchBookUI:onMouseMoveOutside(dx, dy)
    ISPanel.onMouseMoveOutside(self, dx, dy)
end

function SketchBookUI:onMouseUpOutside(x, y)
    ISPanel.onMouseUpOutside(self, x, y)
end

function SketchBookUI:getCategoryAtPosition(mouseX, mouseY)
    if self.currentSpread == 1 then return nil end
    local tocSpreadIndex = self.currentSpread - 1
    if not self.tocSpreads[tocSpreadIndex] then return nil end

    local isLeftPage = mouseX < CONST.BOOK_WIDTH / 2
    local pageEntries = isLeftPage and self.tocSpreads[tocSpreadIndex].left
        or self.tocSpreads[tocSpreadIndex].right

    if not pageEntries then return nil end

    local xOffset = isLeftPage and 0 or CONST.BOOK_WIDTH / 2
    local localX = mouseX - xOffset
    local localY = mouseY

    for _, entry in ipairs(pageEntries) do
        local yPos = entry.yStart
        local chapterHeight = getTextManager():getFontHeight(CONST.FONT.CHAPTER)

        yPos = yPos + chapterHeight

        for _, category in ipairs(entry.categories) do
            local textHeight = getTextManager():getFontHeight(CONST.FONT.CATEGORY)
            if localY >= yPos and localY <= yPos + textHeight then
                if localX >= CONST.PADDING + 20 and
                    localX <= CONST.PADDING + 20 + getTextManager():MeasureStringX(CONST.FONT.CATEGORY, "- " .. category) then
                    return category
                end
            end
            yPos = yPos + textHeight
        end
    end
    return nil
end

function SketchBookUI:jumpToCategory(categoryName)
    for i, page in ipairs(self.categoryPages) do
        if page.name == categoryName then
            local targetSpread = 1 + #self.tocSpreads + math.ceil(i / 2)
            self.currentSpread = math.min(targetSpread, 1 + #self.tocSpreads + math.ceil(#self.categoryPages / 2))
            self:updateNavigationButtons()
            return
        end
    end
end

function SketchBookUI:onClick(button)
    if button.internal == "CLOSE" then
        self:close()
        return
    elseif button.internal == "PREV" then
        self.currentSpread = math.max(1, self.currentSpread - 1)
    elseif button.internal == "NEXT" then
        self.currentSpread = self.currentSpread + 1
    end
    self:updateNavigationButtons()
end

function SketchBookUI:onKeyRelease(key)
    if self:isVisible() and (key == Keyboard.KEY_ESCAPE) then
        self:close()
        return
    end
end

function SketchBookUI:close()
    self:setVisible(false)
    self:removeFromUIManager()
end

return SketchBookUI
