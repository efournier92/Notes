# [Spreadsheets](https://en.wikipedia.org/wiki/Spreadsheet)

## Contents

- [Overview](#overview)
- [MS Excel Functions](#ms-excel-functions)

## Overview

[Spreadsheets](https://en.wikipedia.org/wiki/Spreadsheet) were one of the [killer apps](https://en.wikipedia.org/wiki/Killer_application) that helped [PCs](https://en.wikipedia.org/wiki/Personal_computer) take off. I use them regularly, for everything from basic calculations, to budgeting, to pivot analyses. Although I tend to lean harder on [Google Sheets](https://www.google.com/sheets/about/) and [LibreOffice Calc](https://www.libreoffice.org/discover/calc/) these days, I grew up on [Microsoft Excel](https://products.office.com/en-us/excel). I maintain the following file as a repository for commands and functions I write, whenever I find myself spreadsheeting.

## [MS Excel](https://products.office.com/en-us/excel) Functions

### Trim by Keyword

#### Description

Trim cell contents around a specified keyword.

#### Syntax

```excel
=MID(B2, FIND("gmt",B2) + 7, FIND("""",B2,FIND("""",B2)-1) - FIND("""",B2) + 36)
```

