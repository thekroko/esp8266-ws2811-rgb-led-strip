-- set the color of one LED on GPIO2 to red
local PIN=4
function setRGB(hexStr)
  -- remove special characters, and translate hex
  hexStr = string.gsub(hexStr, "[^0-9A-Fa-f]", "");
  -- parse hex string two chars at a time
  data = "";
  for hexlet in hexStr:gmatch("..?") do
    data = data .. string.char(tonumber("0x" .. hexlet));
  end
  -- repeat as necesary
  ws2812.writergb(PIN, data:rep(math.ceil(40 * 3 / #data) + 1))
end
-- show some init color to show that things are working
setRGB("030000,000300,000003");
print("RGB module loaded");
