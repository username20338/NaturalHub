--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- RedzLib V5
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
  Title = "Natural Disaster Survival - Hub",
  SubTitle = "by redz9999",
  SaveFolder = "Redz Config"
})

-- Criando Tabs
local Tab1 = Window:MakeTab({"Um", "cherry"})
local Tab2 = Window:MakeTab({"Dois", "swords"})
local Tab3 = Window:MakeTab({"Três", "user"})

-- Função para Fling (Lançar jogador)
local function flingPlayer(player)
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = character.HumanoidRootPart

        -- Criação da força que empurra o jogador
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)  -- Aumenta a força para um grande impulso
        bodyVelocity.Velocity = humanoidRootPart.CFrame.LookVector * 100  -- Aplica a força na direção em que o jogador está olhando
        bodyVelocity.Parent = humanoidRootPart

        -- Destruir a força após 0.1 segundos para evitar que o jogador continue sendo empurrado
        game:GetService("Debris"):AddItem(bodyVelocity, 0.1)
    end
end

-- Função para lançar jogador aleatório
local function flingRandomPlayer()
    local randomPlayer = game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]
    if randomPlayer ~= game.Players.LocalPlayer then
        flingPlayer(randomPlayer)
    end
end

-- Tab 1 - Funções de Tema
Tab1:AddButton({"Dark Theme", function()
  redzlib:SetTheme("Dark")
end})

Tab1:AddButton({"Darker Theme", function()
  redzlib:SetTheme("Darker")
end})

Tab1:AddButton({"Dark Purple", function()
  redzlib:SetTheme("Purple")
end})

-- Função de Fling Jogador (Botão)
local FlingButton = Tab2:AddButton({
  Name = "Fling Jogador",
  Callback = function()
    local playerToFling = game.Players.LocalPlayer  -- Aqui você pode modificar para escolher o jogador a ser lançado
    flingPlayer(playerToFling)
  end
})

-- Função de Fling Jogador Aleatório
local RandomFlingButton = Tab2:AddButton({
  Name = "Fling Jogador Aleatório",
  Callback = function()
    flingRandomPlayer()
  end
})

-- Funções adicionais do script (como Speed, Auto Jump, etc.)

local Toggle1 = Tab2:AddToggle({
  Name = "Speed",
  Default = false,
  Callback = function(Value)
    if Value then
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100  -- Speed hack
    else
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16  -- Reset Speed
    end
  end
})

Tab2:AddSlider({
  Name = "Speed Slider",
  Min = 1,
  Max = 100,
  Increase = 1,
  Default = 16,
  Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
  end
})

local Toggle2 = Tab2:AddToggle({
  Name = "Auto Jump",
  Default = false,
  Callback = function(Value)
    if Value then
      while true do
        wait(1)
        game.Pl
