" We don't want to set permanent settings in coc-settings.json
" https://stackoverflow.com/questions/61580682/coc-change-setting-from-key-or-script
" TODO: Autoformat..
call coc#config("snippets.priority",110)
call coc#config("inlayHint.enable","false")
call coc#config("coc.preferences.formatOnSaveFiletypes", ["cpp","json","c"])
