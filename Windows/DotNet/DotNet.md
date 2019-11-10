# [.NET](https://dotnet.microsoft.com/)

## Contents
- [Overview](#overview)
- [ASP.NET File Types](#asp.net-file-types)

## Overview
[.NET](https://dotnet.microsoft.com/) is [Microsoft's](https://www.microsoft.com/) core [Software Framework](https://en.wikipedia.org/wiki/Software_framework), which has been available to developers since 2002. I mostly use it with [ASP.NET](https://dotnet.microsoft.com/apps/aspnet), for developing enterprise web applications.

## [ASP.NET](https://dotnet.microsoft.com/apps/aspnet) File Types

### Description
For easy reference, I've compiles the following list of file types, as defined by the [.NET](https://dotnet.microsoft.com/apps/aspnet) [Framework](https://en.wikipedia.org/wiki/Software_framework).

### `.asax`
- `Global.asax`
- Used for application-level logic.

### `.ascx`
- Web User Controls
- Custom controls to be placed onto web pages.

### `.ashx`
- Custom HTTP handlers.

### `.asmx`
- Web service pages.
- From version 2.0 a Code behind page of an `asmx` file is placed into the app_code folder.

### `.axd`
- When enabled in `web.config` requesting trace.axd outputs application-level tracing. Also used for the special `webresource.axd` handler which allows control/component developers to package a component/control complete with images, script, [CSS](https://en.wikipedia.org/wiki/Cascading_Style_Sheets), etc. for deployment in a single file (an 'assembly').

### `.config`
- Web.config is the only file in a specific Web application to use this extension by default (machine.config similarly affects the entire Web server and all applications on it), however ASP.NET provides facilities to create and consume other config files. These are stored in XML format.

### `.cs/vb`
- Code files (cs indicates C#, vb indicates Visual Basic). Code behind files (see above) predominantly have the extension `.aspx.cs` or `.aspx.vb` for the two most common languages. Other code files (often containing common `library` classes) can also exist in the web folders with the cs/vb extension. In ASP.NET 2 these should be placed inside the `App_Code` folder where they are dynamically compiled and available to the whole application.

### `.dbml`
- `LINQ` to `SQL` data classes file

### `.master`
- 2.0 master page file

### `.resx`
- Resource files for internationalization and localization. Resource files can be global (e.g. messages) or "local" which means specific for a single `aspx` or `ascx` file.

### `.sitemap`
- `Sitemap` configuration files.
- Default file name is `web.sitemap`.

### `.skin`
- Theme skin files.

### `.svc`
- [Windows Communication Foundation](https://docs.microsoft.com/en-us/dotnet/framework/wcf/getting-started-tutorial) service file

### `browser`
- Browser capabilities files stored in XML format; introduced in version 2.0. ASP.NET 2 includes many of these by default, to support common web browsers. These specify which browsers have which capabilities, so that ASP.NET 2 can automatically customize and optimize its output accordingly. Special .browser files are available for free download to handle, for instance, the W3C Validator, so that it properly shows standards-compliant pages as being standards-compliant. Replaces the harder-to-use `BrowserCaps` section that was in `machine.config` and could be overridden in `web.config` in [ASP.NET](https://dotnet.microsoft.com/apps/aspnet) 1.x.

