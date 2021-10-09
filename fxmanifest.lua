fx_version "cerulean"
game "gta5"

ui_page "ui/ui.html"

files {
    "ui/*"
}

client_script "client/*.lua"

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server/*.lua"
}
