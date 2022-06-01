ESX = exports.es_extended:getSharedObject()

-- GARAGE -- -- GARAGE -- -- GARAGE -- -- GARAGE -- -- GARAGE -- -- GARAGE -- -- GARAGE -- -- GARAGE -- -- GARAGE -- -- GARAGE -- -- GARAGE -- -- GARAGE -- -- GARAGE -- -- GARAGE -- -- GARAGE --  
    Citizen.CreateThread(function()
        Wait(250)
        for k,v in pairs(Garage) do 
            TriggerEvent('gridsystem:registerMarker', {
                name = 'ritiroGarage'..k,
                pos = v.posRitiro,
                size = vector3(5.0, 5.0, 5.0),
                scale = vector3(1.5, 1.5, 1.5),
                drawDistance = 10.0,
                msg = '~p~[E] ~w~Prendi il Veicolo',
                type = 36,
                color = { r = 0, g = 255, b = 0 },
                control = 'E',
                permission = k,
                action = function()
                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'goldino', {
                        title = 'Ritira Veicolo',
                        align = 'right',
                        elements = v.veicoli
                    },     function(data, menu)
                            local verifica = data.current.value
                                ESX.Game.SpawnVehicle(data.current.value, v.posDeposito, v.heading, function(vehicle)
                                    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
                                end)
                            menu.close()
                        end, 
                    function(data, menu)
                        menu.close()
                    end)
                end
            })
            TriggerEvent('gridsystem:registerMarker', {
                name = 'depositoGarage'..k,
                pos = v.posDeposito,
                size = vector3(5.0, 5.0, 5.0),
                scale = vector3(1.5, 1.5, 1.5),
                drawDistance = 10.0,
                msg = '~p~[E] ~w~Deposita il Veicolo',
                type = 36,
                color = { r = 255, g = 0, b = 0 },
                control = 'E',
                permission = k,
                action = function()
                    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                    DeleteEntity(veh)
                end
            })
        end
    end)
-- FINE GARAGE -- -- FINE GARAGE -- -- FINE GARAGE -- -- FINE GARAGE -- -- FINE GARAGE -- -- FINE GARAGE -- -- FINE GARAGE -- -- FINE GARAGE -- -- FINE GARAGE -- -- FINE GARAGE -- -- FINE GARAGE -- -- FINE GARAGE -- 
