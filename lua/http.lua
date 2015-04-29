-- a simple http server
if srv ~= nil then srv:close() end
srv=net.createServer(net.TCP, 1);
srv:listen(80, function(socket) 
    socket:on("receive",function(socket,request) 
      local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
      if vars ~= nil then
        -- change color
        setRGB(vars);
        socket:send("ack");
        socket:close();
        return;
      end

      socket:send("<h1>rgb led strip</h1>");
      socket:send("example: /?FF00FF");
      socket:send('<ul><li><a href="/?0">OFF</a></li><li><a href="/?300000">RED</a></li><li><a href="/?003000">GREEN</a></li><li><a href="/?000030">BLUE</a></li><li><a href="/?202020">WHITE</a></li></ul>');
      socket:close();
    end) 
end)
print("HTTP module loaded");
