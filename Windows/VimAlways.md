# Always Use VIM In Windows

### Add the following entry to Registry
```txt
REGEDIT4
[HKEY_CLASSES_ROOT\Unknown\shell]
@="vim"
[HKEY_CLASSES_ROOT\Unknown\shell\vim]
[HKEY_CLASSES_ROOT\Unknown\shell\vim\command]
@="\"C:\\Program Files (x86)\\Vim\\vim81\\gvim.exe\" \"%1\""
```

