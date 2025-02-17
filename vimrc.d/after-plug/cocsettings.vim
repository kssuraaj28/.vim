" We don't want to set permanent settings in coc-settings.json
" https://stackoverflow.com/questions/61580682/coc-change-setting-from-key-or-script

if empty($DISABLE_COCVIM)
    call coc#config("snippets.priority",110)
    call coc#config("inlayHint.enable","false")
    call coc#config("coc.preferences.formatOnSaveFiletypes", ["cpp","json","c"])
endif
" TODO: Can we have the two previous things in the same call?
