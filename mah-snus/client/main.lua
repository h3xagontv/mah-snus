local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('mah-snus:client:UsingSnus')
AddEventHandler('mah-snus:client:UsingSnus', function(source)
    local playerPed = PlayerPedId()
    QBCore.Functions.Progressbar('snus', 'Tar en snus', 2100, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_suicide",
        anim = "pill",
        flags = 49,
    }, {}, {}, function()
        StopAnimTask(ped, "mp_suicide", "pill", 1.0)
        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 15))
    end, function()
        StopAnimTask(ped, "mp_suicide", "pill", 1.0)
        if Config.Notify == "qb" then
        QBCore.Functions.Notify('Avbrutt', 'error')
        elseif Config.Notify == "ox" then
            lib.notify({
                title = 'Avbrutt',
                position = Config.LibNotifyPos,
                type = 'error'
            })
        end
    end)
end)




RegisterNetEvent('mah-snus:client:usesnuspack')
AddEventHandler('mah-snus:client:usesnuspack', function(source)
    local playerPed = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(playerPed))
    QBCore.Functions.Progressbar('snus', 'Åpner snusboks', 2100, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_arresting",
        anim = "a_uncuff",
        flags = 49,
    }, {}, {}, function()
        StopAnimTask(ped, "mp_arresting", "a_uncuff", 1.0)
        if Config.Notify == "qb" then
            print("qb")
            QBCore.Functions.Notify('Åpnet Snusboks', 'success')
        elseif Config.Notify == "ox" then
            print("ox")
            lib.notify({
                title = 'Åpnet Snusboks',
                position = Config.LibNotifyPos,
                type = 'success'
            })
        end
    end, function()
        StopAnimTask(ped, "mp_arresting", "a_uncuff", 1.0)
        if Config.Notify == "qb" then
           
            QBCore.Functions.Notify('Avbrutt', 'error')
            elseif Config.Notify == "ox" then
                print("ox")
                lib.notify({
                    title = 'Avbrutt',
                    position = Config.LibNotifyPos,
                    type = 'error'
                })
            end
    end)
end)