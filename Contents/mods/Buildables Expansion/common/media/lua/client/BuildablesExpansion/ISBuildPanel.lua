local old_ISBuildPanel_createChildren = ISBuildPanel.createChildren

---@diagnostic disable-next-line: duplicate-set-field
function ISBuildPanel:createChildren()
    local result = old_ISBuildPanel_createChildren(self)
    if self.recipeCategories then self.recipeCategories.autoWidth = true end
    return result
end
