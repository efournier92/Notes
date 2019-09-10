# Windows Commands

## Description
Commands I sometimes use when forced to operate in a [Windows](https://en.wikipedia.org/wiki/Microsoft_Windows) environment.

## Commands

### Set Default Program to Open Files

```dos
assoc .="No Extension"
ftype "No Extension"="C:\path\to\my editor.exe" "%1"
```

### Favor [`vim`](https://www.vim.org/) for editing
[`vim`](https://www.vim.org/) is my preferred text editor for [`mardown`](https://daringfireball.net/projects/markdown/) and small projects. To make [Windows](https://en.wikipedia.org/wiki/Microsoft_Windows) favor [`vim`](https://www.vim.org/) as the system text editor, add the following entry to you [Registry](https://en.wikipedia.org/wiki/Windows_Registry).

```dos
REGEDIT4
[HKEY_CLASSES_ROOT\Unknown\shell]
@="vim"
[HKEY_CLASSES_ROOT\Unknown\shell\vim]
[HKEY_CLASSES_ROOT\Unknown\shell\vim\command]
@="\"C:\\Program Files (x86)\\Vim\\vim81\\gvim.exe\" \"%1\""
```

### [`slmgr`](https://docs.microsoft.com/en-us/windows/deployment/volume-activation/activate-using-key-management-service-vamt) Commands
[`slmgr`](https://docs.microsoft.com/en-us/windows/deployment/volume-activation/activate-using-key-management-service-vamt) is a [Windows](https://en.wikipedia.org/wiki/Microsoft_Windows) service that ensures you're licensed, and sometimes acts buggy. If you find this service misbehaving, the following commands may come in handy.

#### Show Details

```dos
slmgr -dli
```

#### Rearm

```dos
slmgr -rearm
```

### Set `SHELL` Environment Variable to `zsh` for [Cygwin](https://www.cygwin.com/)

1. Press `Windows` Key
2. Find & `Environment Variables`
3. Set `Variable` as `SHELL`
5. Set `Value` as `/usr/bin/zsh`

### Enable Scroll Lock
Use the following command to enable system [`Scroll Lock`](https://en.wikipedia.org/wiki/Scroll_Loc://en.wikipedia.org/wiki/Scroll_Lock) in [DOS](https://en.wikipedia.org/wiki/DOS).

```dos
wsh = New-Object -ComObject WScript.Shell
wsh.SendKeys('{SCROLLLOCK}')
```

