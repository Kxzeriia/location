ESX = nil



TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('kxzeriia:BuyBlista')
AddEventHandler('kxzeriia:BuyBlista', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 800
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~r~$800")    
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez d'argent, il vous manque: ~r~$"..price-xMoney.."")
    end       
end)

RegisterNetEvent('kxzeriia:BuyVespa')
AddEventHandler('kxzeriia:BuyVespa', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 500
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, "Vous avez payé ~r~$500")    
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez d'argent, il vous manque: ~r~$"..price-xMoney.."")
    end       
end)