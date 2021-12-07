local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("wk:onPlateScanned")
AddEventHandler("wk:onPlateScanned", function(cam, plate, index)
    local src = source
    local result = exports.oxmysql:executeSync("SELECT * FROM player_vehicles WHERE plate LIKE ?", { plate })
    if result[1] ~= nil then
        for k, v in pairs(result) do
            local player = exports.oxmysql:executeSync("SELECT * FROM players WHERE citizenid = ?", { result[k].citizenid })
            if player[1] ~= nil then
                local plate = result[k].plate
                local charinfo = json.decode(player[1].charinfo)
                local vehInfo = QBCore.Shared.Vehicles[result[k].vehicle]
                local owner = charinfo.firstname .. " " .. charinfo.lastname

                if vehInfo ~= nil then
                    local label = vehInfo["name"]
                    TriggerClientEvent("qb-alpr:client:notify", src, plate, owner, label)
                    exports.wk_wars2x:TogglePlateLock(src, cam, true, false)
                else
                    local label = "Name not found.."
                    TriggerClientEvent("qb-alpr:client:notify", src, plate, owner, label)
                    exports.wk_wars2x:TogglePlateLock(src, cam, true, false)
                end
            end
        end
    end
end)