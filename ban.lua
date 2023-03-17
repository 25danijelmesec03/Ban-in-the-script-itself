local blockedDiscordIDs = { "discord-id", "discord-id", "discord-id" }
local blockedLicenses = { "licence1", "licence2", "license3" }

AddEventHandler('playerConnecting', function (playerName, setKickReason)
  local discord, license  = "UNKNOWN", "UNKNOWN"

  for k,v in ipairs(GetPlayerIdentifiers(source)) do
      if string.sub(v, 1, string.len("license:")) == "license:" then
        license = v
      elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
        discord = string.sub(v, 9)
        print("DEBUG: " ..discord)
      end
  end

  for i = 1, #blockedDiscordIDs, 1 do
      if (tostring(blockedDiscordIDs[i]) == tostring(discord)) then
          setKickReason("INFO | You are denied access to this server.")
          CancelEvent()
          break
      end
  end

  for i = 1, #blockedLicenses, 1 do
    if (tostring(blockedLicenses[i]) == tostring(license)) then
        setKickReason("INFO | You are denied access to this server.")
        CancelEvent()
        break
    end
end
end)