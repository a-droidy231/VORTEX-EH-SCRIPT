
-- VORTEX EH
-- Emergency Hamburg
-- Menu: F2

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

end)

local Window = Rayfield:CreateWindow({
    Name = "VORTEX EH",
    LoadingTitle = "VORTEX",
    LoadingSubtitle = "Emergency Hamburg",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "VORTEX",
        FileName = "EH_Config"
    },
    KeySystem = false
})

local Settings = {
    ForwardSpeed = 25,
    ReverseSpeed = 15,
    VehicleHeight = 0,
    Acceleration = 1,
    BrakePower = 1
}

-- VEHICLE

local Vehicle = Window:CreateTab("Vehicle", 4483362458)

Vehicle:CreateSection("Geschwindigkeit")

Vehicle:CreateInput({
    Name = "Vorwärtsgeschwindigkeit",
    PlaceholderText = "25",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        Settings.ForwardSpeed = tonumber(value) or 25
    end
})

Vehicle:CreateInput({
    Name = "Rückwärtsgeschwindigkeit",
    PlaceholderText = "15",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        Settings.ReverseSpeed = tonumber(value) or 15
    end
})

Vehicle:CreateSection("Fahrzeug")

Vehicle:CreateInput({
    Name = "Fahrzeughöhe",
    PlaceholderText = "0",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        Settings.VehicleHeight = tonumber(value) or 0
    end
})

Vehicle:CreateInput({
    Name = "Beschleunigung",
    PlaceholderText = "1",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        Settings.Acceleration = tonumber(value) or 1
    end
})

Vehicle:CreateInput({
    Name = "Bremskraft",
    PlaceholderText = "1",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        Settings.BrakePower = tonumber(value) or 1
    end
})

Vehicle:CreateButton({
    Name = "Einstellungen anzeigen",
    Callback = function()
        for name, value in pairs(Settings) do
            print(name, value)
        end

        Rayfield:Notify({
            Title = "VORTEX EH",
            Content = "Einstellungen gespeichert!",
            Duration = 4
        })
    end
})

-- PLAYER

local Player = Window:CreateTab("Player", 4483362458)

Player:CreateSlider({
    Name = "Kamera-FOV",
    Range = {50, 120},
    Increment = 1,
    Suffix = "°",
    CurrentValue = 70,
    Callback = function(value)
        workspace.CurrentCamera.FieldOfView = value
    end
})

-- SETTINGS

local SettingsTab = Window:CreateTab("Settings", 4483362458)

SettingsTab:CreateKeybind({
    Name = "Menü öffnen/schließen",
    CurrentKeybind = "F2",
    HoldToInteract = false,
    Callback = function()
        Window:Toggle()
    end
})

Rayfield:Notify({
    Title = "VORTEX EH",
    Content = "VORTEX erfolgreich gestartet!",
    Duration = 5
})
