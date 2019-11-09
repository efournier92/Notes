# [PDFs](https://en.wikipedia.org/wiki/PDF)

## Contents
- [Overview](#overview)
- [Rotate](#rotate)
- [Crop](#crop)
  - [Left Side](#left-side)
- [Reduce File Size](#reduce-file-size)

## Overview
I often find myself needing to manipulate [PDF](https://en.wikipedia.org/wiki/PDF) files in various ways, to the point where common [GUI](https://en.wikipedia.org/wiki/Graphical_user_interface) tools don't cut it. When in such a position, I turn to various [CLI](https://en.wikipedia.org/wiki/CLI) tools, which are outlined below.

### Rotate

### Description
When I need to rotate the pages of a [PDF](https://en.wikipedia.org/wiki/PDF), I use [pdftk](https://www.pdflabs.com/docs/pdftk-man-page/) in conjunction with a variation the following command.

### Commands

#### Install Dependency
```bash
sudo add-apt-repository ppa:malteworld/ppa
sudo apt install pdftk
```

#### Rotate Clockwise
```bash
pdftk input.pdf cat 1-endeast output output.pdf
```

## Crop

### Description
To crop a [PDF](https://en.wikipedia.org/wiki/PDF), I use [pdfcrop](https://ctan.org/pkg/pdfcrop).

### Commands

#### Install Dependency
```bash
sudo apt-get install texlive-extra-utils
```

#### Left Side
```bash
pdfcrop --margins '30 0 0 0' output_rotate.pdf output_rotate_crop.pdf
```

## Reduce File Size

### Description
[ghostscript](https://www.ghostscript.com/) is a tremendously capable tool, which I don't know enough about. However, when I want to reduce the file size of a [PDF](), I use the following command.

### Command
```bash
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dAutoRotatePages=/All -dDownsampleColorImages=true \
-dColorImageResolution=150 -dNOPAUSE  -dBATCH -sOutputFile=output.pdf input.pdf
```

