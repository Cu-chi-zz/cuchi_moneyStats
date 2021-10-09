if mysqlLibrary == "" then
   print("[^6"..GetCurrentResourceName().."^7]: ^1Don't forget to config the mysql library in config.lua^7")
end

RegisterNetEvent("cgd:get")
AddEventHandler("cgd:get", function() 
   local _source = source

   if mysqlLibrary == "mysql-async" then
      MySQL.Async.fetchAll("SELECT accounts FROM users", {}, function(result)
         TriggerClientEvent("cgd:s", _source, result)
      end)
   elseif mysqlLibrary == "ghmattimysql" then
      exports.ghmattimysql:execute("SELECT accounts FROM users", {}, function(result)
         TriggerClientEvent("cgd:s", _source, result)
      end)
   elseif mysqlLibrary == "oxmysql" then
      exports.oxmysql:execute("SELECT accounts FROM users", {}, function(result)
         TriggerClientEvent("cgd:s", _source, result)
      end)
   else
      print("[^6"..GetCurrentResourceName().."^7]: ^1Don't forget to config the mysql library in config.lua^7")
   end
end)