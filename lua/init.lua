-- List of Networks
SSID = {"Donuts.", "arcturus" };
KEY =  {"PASSWORD1", "PASSWORD2"};

local function onConnect()
  print("Loading modules..");
  rgb = require "rgb";
  http = require "http";
  print("All modules loaded");
end

local function tryConnectToWifi(i)
  ip = wifi.sta.getip();
  if ip ~= nil then
    print("Connected with IP="..ip);
    onConnect();
    return;
  end

  -- Tries connecting to the i'th wifi
  i = i % table.getn(SSID);
  ssid = SSID[i+1];
  key = KEY[i+1];
  
  print("Trying to connect to SSID="..ssid.." KEY="..key);
  wifi.setmode(wifi.STATION);
  wifi.sta.config(ssid, key);

  tmr.alarm(0, 5000, 0, function() tryConnectToWifi(i+1) end);
end

tryConnectToWifi(0);
