RegisterCommand("serverstats", function() 
    TriggerServerEvent("cgd:get")
end)

RegisterNetEvent("cgd:s")
AddEventHandler("cgd:s", function(data)
    local cash, bank, black = Calculate(data)

    SendNUIMessage({
        type = "menu",
        cash = Format(cash),
        bank = Format(bank),
        black = Format(black)
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback('exit', function(data, cb)
    SetNuiFocus(false, false)
    cb("OK")
end)

function Format(amount)
    local formatted = amount
    while true do  
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1 %2')
        if k == 0 then
            break
        end
    end
    return formatted
end

function Calculate(d)
    local totalCash = 0
    local totalBank = 0
    local totalBlack = 0
    for i = 1, #d, 1 do
        for k, v in pairs(json.decode(d[i].accounts)) do
            if k == "bank" then
                totalBank = totalBank + v
            elseif k == "money" then
                totalCash = totalCash + v
            elseif k == "black_money" then
                totalBlack = totalBlack + v
            end
        end
    end
    return totalCash, totalBank, totalBlack
end