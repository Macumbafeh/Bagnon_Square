local function SquareLayout(self)
    -- count visible space
    local count = 0
    for _, bag in ipairs(self.visibleBags) do
        count = count + self.bagSizes[bag]
    end

    -- calculate new size
    local newSize = ceil(sqrt(count))

    -- change layout if new size differs from current
    if self:GetLayout() ~= newSize then
        self:Layout(newSize)
    end
end

local function CreateInventory_OnShowHook(self)
    local bags = self.bags
    local OnShow = bags:GetScript("OnShow")
    bags:SetScript("OnShow", function(self)
        OnShow(self)
        SquareLayout(self)
    end)
end

local function CreateBank_OnShowHook(self)
    local bank = self.bank
    local OnShow = bank:GetScript("OnShow")
    bank:SetScript("OnShow", function(self)
        OnShow(self)
        SquareLayout(self)
    end)
end

hooksecurefunc(Bagnon, "CreateInventory", CreateInventory_OnShowHook)
hooksecurefunc(Bagnon, "CreateBank", CreateBank_OnShowHook)
