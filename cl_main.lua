QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent("qb-alpr:client:notify")
AddEventHandler("qb-alpr:client:notify", function(plate, owner, label, flags)
    QBCore.Functions.Notify({ text = Config.Strings["title"], caption = string.format(Config.Strings["caption"], label, owner, plate, flags) }, Config.NotificationType, Config.NotificationTimeout)
end)
