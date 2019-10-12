# PDFs

## Overview

## Commands

### Reduce File Size
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dAutoRotatePages=/All -dDownsampleColorImages=true \
-dColorImageResolution=150 -dNOPAUSE  -dBATCH -sOutputFile=output.pdf input.pdf

### Rotate

#### Install Dependencies
```bash
sudo add-apt-repository ppa:malteworld/ppa
sudo apt install pdftk
```

#### Rotate Clockwise
```bash
pdftk input.pdf cat 1-endeast output output.pdf
```

### Crop

#### Install Dependencies
```bash
sudo apt-get install texlive-extra-utils
```

#### Crop Left Side
```bash
pdfcrop --margins '30 0 0 0' output_rotate.pdf output_rotate_crop.pdf
```

