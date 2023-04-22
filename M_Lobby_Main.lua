--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type M_Lobby_Main_C
local M = UnLua.Class()

-- function M:Initialize(Initializer)
-- end

-- function M:UserConstructionScript()
-- end

local PrintString = UE.UKismetSystemLibrary.PrintString

function M.Print(text, color, duration)
    color = color or UE.FLinearColor(1, 0, 1, 1)
    duration = duration or 2
    UE.UKismetSystemLibrary.PrintString(nil, text, true, false, color, duration)
end

function M:ReceiveBeginPlay()
    -- self.Print("M_Lobby_Main_C:ReceiveBeginPlay") 
    -- 加载widget到viewport
    local widget_class = UE.UClass.Load("/Game/GR/UI/UserWidget/Main/UI_Main.UI_Main_C")
    local widget_root = NewObject(widget_class, self)
    widget_root:AddToViewport()
end

-- function M:ReceiveEndPlay()
-- end

-- function M:ReceiveTick(DeltaSeconds)
-- end

-- function M:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
-- end

-- function M:ReceiveActorBeginOverlap(OtherActor)
-- end

-- function M:ReceiveActorEndOverlap(OtherActor)
-- end

return M
