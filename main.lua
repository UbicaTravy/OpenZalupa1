-- це делал убийца травишки ^_^
-- якщо код не нравиться - пiшов нахуй, хлопець
-- це простой код на lua для OpenOS из мода для Minecraft "OpenComputers"

local component = require("component")
local computer = require("computer")
local event = require("event")

if not component.isAvailable("gpu") then
  print("Требуется видеокарта (GPU)!")
  return
end

local gpu = component.gpu

local oldBackground = gpu.getBackground()
local oldForeground = gpu.getForeground()
local w, h = gpu.getResolution()

gpu.setBackground(0x0000FF) -- синий цвет
gpu.setForeground(0xFFFFFF) -- белый текст
gpu.fill(1, 1, w, h, " ")

local message = "Hello, OpenOS! Its KillerGrass!"

local x = math.floor((w - #message) / 2)
local y = math.floor(h / 2)

gpu.set(x, y, message)

gpu.setForeground(0xFFFF00)

print(" ")

local _, _, char, code = event.pull("key_down")

gpu.setBackground(oldBackground)
gpu.setForeground(oldForeground)
gpu.fill(1, 1, w, h, " ")