-- BerryNotes - Simple Version

print("|cFF00FF00[BerryNotes]|r: Loading version...")
print("|cFF00FF00[BerryNotes]|r: Testing command registration...")

-- Setting the slash comm
SLASH_BERRYNOTES1 = "/berrynotes"
SLASH_BERRYNOTES2 = "/bn"
SLASH_BERRYNOTES3 = "/berry"
SlashCmdList["BERRYNOTES"] = function(msg)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_SAY")
frame:RegisterEvent("CHAT_MSG_PARTY") 
frame:RegisterEvent("CHAT_MSG_GUILD")
frame:RegisterEvent("CHAT_MSG_WHISPER")
frame:SetScript("OnEvent", function(self, event, msg, sender)
    if sender == UnitName("player") then
        msg = msg:lower()
        if msg == "#berrytest" then
            print("|cFF00FF00[SUCCESS]|r Chat command worked!")
        end
    end
end)

-- Structure
-- Initialize saved variables - PERSISTS THROUGH RELOADS
BerryNotesDB = BerryNotesDB or {
    text = "",  -- Your notes are saved here
    isShown = true,
    width = 300,
    height = 200,
    point = "TOPLEFT",
    relativePoint = "TOPLEFT",
    x = 0,
    y = 0
}

-- frame 
local noteFrame = CreateFrame("Frame", "BerryNotesMainFrame", UIParent, "BackdropTemplate")
noteFrame:SetSize(300, 200)
noteFrame:SetPoint("TOPLEFT")
noteFrame:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
noteFrame:SetBackdropColor(1, 1, 0.8, 0.9)



local editBox = CreateFrame("EditBox", "BerryNotesEditBox", noteFrame)
editBox:SetPoint("TOPLEFT", 10, -30)
editBox:SetPoint("BOTTOMRIGHT", -10, 10)
editBox:SetMultiLine(true)
editBox:SetFontObject("ChatFontNormal")
editBox:SetText(BerryNotesDB.text or "Write your notes here...")
editBox:SetScript("OnTextChanged", function(self)
    BerryNotesDB.text = self:GetText()
end)

-- Load saved text
if BerryNotesDB.text and BerryNotesDB.text ~= "" then
    editBox:SetText(BerryNotesDB.text)
else
    editBox:SetText("")
end

-- Function to save text manually
local function SaveNotes()
    BerryNotesDB.text = editBox:GetText()
    print("|cFF00FF00BerryNotes:|r Notes saved!")
end

-- Save text when it changes (while typing)
editBox:SetScript("OnTextChanged", function(self)
    BerryNotesDB.text = self:GetText()
end)

-- toggle function
function BerryNotes_Toggle()
    if noteFrame:IsShown() then
        noteFrame:Hide()
        BerryNotesDB.isShown = false
        print("|cFF00FF00BerryNotes:|r Hidden")
    else
        noteFrame:Show()
        BerryNotesDB.isShown = true
        print("|cFF00FF00BerryNotes:|r Shown")
    end
end

SlashCmdList["BERRYNOTES"] = function(msg)
    BerryNotes_Toggle()
end

if BerryNotesDB.isShown then
    noteFrame:Show()
else
    noteFrame:Hide()
end

print("|cFF00FF00[BerryNotes]|r: Addon loaded. Enjoy!")