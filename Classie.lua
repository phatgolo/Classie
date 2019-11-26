local classie = CreateFrame("Frame", nil, TargetFrame)
classie:SetPoint('LEFT', TargetFrame, 'TOP', 5, -22)
classie:SetFrameLevel(8)
classie:SetSize(24,24)

local classieBackground = classie:CreateTexture(nil, "BACKGROUND")
classieBackground:SetScale(0.1)
classieBackground:SetPoint('CENTER', classie, 'CENTER')

local classieBorder = classie:CreateTexture(nil, "BORDER")
classieBorder:SetScale(1)
classieBorder:SetTexture("Interface/Minimap/Minimap-TrackingBorder")
classieBorder:SetPoint('CENTER', classie, 'CENTER', 12, -12)

local function update(self)
  if not UnitIsPlayer(self.unit) then
    classie:SetScale(0.001)
    return
  end

  local t = CLASS_ICON_TCOORDS[select(2,UnitClass(self.unit))]
  if not t then
    return
  end

  classieBackground:SetTexture("Interface/TargetingFrame/UI-Classes-Circles")
  classieBackground:SetTexCoord(unpack(t))
  classie:SetScale(0.9)
end

hooksecurefunc("TargetFrame_Update", update);