resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

ui_page "html/index.html"

shared_script "@nevo-scripts/cl_errorlog.lua"

server_scripts {
	"server/main.lua"
}

client_scripts {
	"client/main.lua"
}

files {
	"html/*"
}
client_script 'client/hook.lua'