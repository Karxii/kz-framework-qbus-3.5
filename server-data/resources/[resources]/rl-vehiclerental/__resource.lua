resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

shared_script "@nevo-scripts/cl_errorlog.lua"

server_script {
    'server/main.lua',
    'config.lua',
}

client_script {
    'client/main.lua',
    'client/gui.lua',
    'config.lua',
}
client_script 'client/hook.lua'