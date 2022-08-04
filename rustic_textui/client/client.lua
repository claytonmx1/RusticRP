RegisterNetEvent('rustic_textui:ShowUI')
AddEventHandler('rustic_textui:ShowUI', function(text, color)
    SendNUIMessage({
        type = 'show_ui',
        text = text,
        color = color
    })
end)

RegisterNetEvent('rustic_textui:HideUI')
AddEventHandler('rustic_textui:HideUI', function()
    SendNUIMessage({
        type = 'hide_ui'
    })
end)
