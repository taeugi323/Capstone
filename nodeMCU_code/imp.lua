ssid = "Gx2_4189"
password = "taeugi323"  -- Hotspot ID and password
host = '61.37.62.236'
path = "/transmit?"     -- url format. Server is a node.js virtual web server.
ready = false

uart.setup(0, 9600, 8, 0, 1, 0)
uart.on("data", "\n", function(data)
  data = string.gsub(data, "[\r\n]", " ")
  call_server(data)
end, 0)  

wifi.setmode(wifi.STATION)
wifi.sta.config(ssid, password)
wifi.sta.autoconnect(1)

cnt = 1
tmr.alarm(3, 3000, 1, function() 
  if (wifi.sta.getip() == nil) and (cnt < 20) then 
    print("trying wifi AP..."..cnt.." sec")
    cnt = cnt + 1 
  else 
    tmr.stop(3)
    if (cnt < 20) then 
      ip = wifi.sta.getip();
      print("got wifi="..ip..", status="..wifi.sta.status());
      ready = true
    else node.restart()
    end
    cnt = nil;
  end
end)
  
function call_server(value)

  if ready == false then return end
  
  conn=net.createConnection(net.TCP, 0) 
  conn:connect(2232, host) 
  print("[pre_connection] OK ")
  conn:on("connection",function(conn, payload)
    print("[connection] "..path..value)
    conn:send("GET "..path..value.." HTTP/1.1\r\n"..
      "Host: "..host.."\r\n"..
      "Connection: keep-alive\r\n"..
      "Accept: */*\r\n"..
      "User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36\r\n"..
      "\r\n") 
    print("[connection] Finished")
  end) 
  
  conn:on("receive", function(conn, payload) 
    print("[receive] "..payload)
    conn:close();
  end)
    
end


