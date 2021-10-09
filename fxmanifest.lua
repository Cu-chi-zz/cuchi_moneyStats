fx_version "cerulean"
game "gta5"

ui_page "ui/ui.html"

files {
    "ui/*"
}

client_script "client/*.lua"

server_scripts {
    "config.lua",
    "server/*.lua"
}
