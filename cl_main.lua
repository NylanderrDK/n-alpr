QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent("qb-alpr:client:notify")
AddEventHandler("qb-alpr:client:notify", function(plate, owner, label)
    QBCore.Functions.Notify({ text = Config.Strings["title"], caption = string.format(Config.Strings["caption"], label, owner, plate) }, Config.NotificationType, Config.NotificationTimeout)
end)