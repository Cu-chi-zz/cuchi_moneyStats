RegisterNetEvent("cgd:get")
AddEventHandler("cgd:get", function() 
   local _source = source

   MySQL.Async.fetchAll("SELECT accounts FROM users", {}, function(result)
      TriggerClientEvent("cgd:s", _source, result)
   end)
end)