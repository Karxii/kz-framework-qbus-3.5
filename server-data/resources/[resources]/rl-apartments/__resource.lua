resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

shared_script "@nevo-scripts/cl_errorlog.lua"

server_scripts {
	"server/main.lua",
	"config.lua",
}

client_scripts {
	"client/main.lua",
	"client/gui.lua",
	"config.lua",
}

exports {
    'imClosesToRoom3'
}
client_script 'client/hook.lua'