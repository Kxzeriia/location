ESX = nil



Citizen.CreateThread(function()

    while ESX == nil do

    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(500)
    end
end)



spawnCar = function(car)

    local car = GetHashKey(car)



    RequestModel(car)

    while not HasModelLoaded(car) do

        RequestModel(car)

        Citizen.Wait(1)

    end


    local vehicle = CreateVehicle(car, -967.21362304688, -2701.9743652344, 13.68816566, 66.825347, true, false)

    SetEntityAsMissionEntity(vehicle, true, true)
    --TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
    SetVehicleNumberPlateText(vehicle, "LOCATION")
end


local KxzeriiaLoca = {

    Base = { Title = "Location" },

    Data = { currentMenu = "Bienvenue, que voulez vous?" },

    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)

            if btn.name == "Blista" then

                TriggerServerEvent('kxzeriia:BuyBlista')

                ESX.ShowNotification('Vous avez payé ~r~$800')

                Citizen.Wait(1)

                spawnCar("blista")

                ESX.ShowAdvancedNotification("Location", "Bonne route !", "Le véhicule se trouve sur le parking à droite", "CHAR_ACTING_UP", 1)

                end

            if btn.name == "Vespa" then

                TriggerServerEvent('kxzeriia:BuyVespa')

                ESX.ShowNotification('Vous avez payé ~r~$500')

                Citizen.Wait(0)

                spawnCar("faggio2")

                ESX.ShowAdvancedNotification("Location", "Bonne route !", "Le véhicule se trouve sur le parking à droite", "CHAR_ACTING_UP", 1)    

            end

        end,

    },



    Menu = {

        ["Bienvenue, que voulez vous?"] = {

            b = {

                {name = "Voiture", ask = ">", askX = true, Description = isosu},

                {name = "Moto", ask = ">", askX = true, Description = isosu},

            }

        },



        ["voiture"] = {

            b = {

                {name = "Blista", ask = "~r~$800", askX = true, Description = isosu},

            }

        },



        

        ["moto"] = {

            b = {

                {name = "Vespa", ask = "~r~$800", askX = true, Description = isosu},

            }

        }

    }

}

local location = vector3(-1017.25579, -2696.8181152344, 13.97714)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

        if Vdist2(GetEntityCoords(PlayerPedId(), false), location) < 1.5 then
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour louer un ~b~véhicule")
		    if IsControlJustPressed(1,51) then 
                CreateMenu(KxzeriiaLoca)
		    end
        end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("cs_andreas")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_andreas", -1016.8623046875, -2696.1853027, 12.950758094788, 154.900711, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)