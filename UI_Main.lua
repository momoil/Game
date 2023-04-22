--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type UI_Main_C
local M = UnLua.Class()

--function M:Initialize(Initializer)
--end

--function M:PreConstruct(IsDesignTime)
--end

function M:Construct()
    -- 绑定按钮事件
	self.BtnStartGame.OnClicked:Add(self, M.OnBtnStartClicked)
    self.BtnSetting.OnClicked:Add(self, M.OnBtnSettingClicked)
    self.BtnHelp.OnClicked:Add(self, M.OnBtnHelpClicked)
    self.BtnInfo.OnClicked:Add(self, M.OnBtnInfoClicked)
    -- 设置ListView
    for i = 1, 100, 1 do
        local UIComp_Main_ListItem = NewObject(self.ListView.EntryWidgetClass, self)
        self.ListView:AddItem(UIComp_Main_ListItem)
    end
    
end

function M:OnBtnStartClicked()
    -- 判断当前透明度是否为1
    if self.BtnStartGame:GetRenderOpacity() == 1 then
        self.BtnStartGame:SetRenderOpacity(0.5)
    else
        self.BtnStartGame:SetRenderOpacity(1)
    end
end

function M:OnBtnSettingClicked()
    print("OnBtnSettingClicked")
end

function M:OnBtnHelpClicked()
    print("OnBtnHelpClicked")
end

function M:OnBtnInfoClicked()
    -- print("OnBtnInfoClicked")
    local UIComp_Main_Item_Class = UE.UClass.Load("/Game/GR/UI/UserWidget/Main/MainComp/UIComp_Main_Item.UIComp_Main_Item_C")
    local UIComp_Main_Item = NewObject(UIComp_Main_Item_Class, self)
    local Slot = self.CanvasPanel:AddChildToCanvas(UIComp_Main_Item)
    -- 获取当前控件的slot
    local SlotAsCanvasSlot = UE.UWidgetLayoutLibrary.SlotAsCanvasSlot(UIComp_Main_Item)
    -- 创建锚点
    Anchors = UE.FAnchors()
    Anchors.Minimum = UE.FVector2D(0, 0)
    Anchors.Maximum = UE.FVector2D(1, 1)
    -- 设置锚点
    SlotAsCanvasSlot:SetAnchors(Anchors)
    -- 设置大小

    SlotAsCanvasSlot:SetSize(UE.FVector2D(0, 0))
    -- 设置位置
    SlotAsCanvasSlot:SetPosition(UE.FVector2D(0, 0))   
end


--function M:Tick(MyGeometry, InDeltaTime)
--end

return M
