Config = {

AlwaysDisplayRadar = false, -- Radar will be turned off when not in a vehicle

--Forth Pill function
DisplayId = false, -- Forth pill displays users id
DisplayStress = false, -- Forth pill displays users stress (You need to get the stress value yourself in the script)
DisplayVoice = true, -- Forth pill will display voice range and when speaking (TokoVOIP or Mumble)


StatusUpdateInterval = 1000, -- Time it takes for status to update (lowering this value adds ms)
VitalsUpdateInterval = 500, -- Time it takes for vitals to update (lowering this value adds ms)

MapZoom = 0.15, -- The zoom of the map (Lower the value more zoomed out it will be)

-- Choose icons from FontAwsome (https://fontawesome.com/) 
HealthIcon = "fa-heartbeat",
ArmorIcon = "fa-shield-alt",
FoodIcon = "fa-hamburger",
ThirstIcon = "fa-tint",
FourthIcon = "fa-microphone", -- Left blank because default function is displaying id (if you use stress or voice add any icon you like)


}


-- Return your hunger, thirst, stress. This uses esx_status and stress is left at 0 because it isn't used by default
function GetStatus(cb)

	TriggerEvent(
                "esx_status:getStatus",
                "hunger",
                function(h)
                    TriggerEvent(
                        "esx_status:getStatus",
                        "thirst",
                        function(t)
                            local hunger = h.getPercent()
                            local thirst = t.getPercent()
                            local stress = 0

                            cb({hunger, thirst, stress})
                        end
                    )
                end
            )

end

