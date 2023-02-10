_G.skip = false --execute just _G.skip=true to skip a song

local playlist = {
["Green Hat Theme"] = "https://raw.githubusercontent.com/resw111/jssomesmallthing/main/expressyourself?token=GHSAT0AAAAAAB6SY6YGEEP2L4DGCTFOI25UY7GRESQ",
}

function chat(msg)
   game:service'ReplicatedStorage'.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, 'All')
end

function sing(url, title)
   local text = game:HttpGet(url, true)
   local lyrics = {}
   for s in text:gmatch("[^\r\n]+") do
       table.insert(lyrics, s)
   end
   local duration = #lyrics * 5
   chat("Duration: " .. tostring(duration) .. " seconds")
   for i,v in pairs(lyrics) do
       if _G.skip then
           chat("Skipping " .. title)
           _G.skip = false
           wait(1)
           break
       end
       wait(5)
       chat(v)
   end
end

for i,v in pairs(playlist) do
   chat("Now playing: " .. i)
   sing(v, i)
end