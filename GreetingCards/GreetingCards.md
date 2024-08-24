# [Greeting Cards](https://en.wikipedia.org/wiki/Greeting_card)

## Contents

- [Overview](#overview)
- [Install Dependencies](#install-dependencies)
- [Download the Template](#download-the-template)
- [Unzip the Directory](#unzip-the-directory)
- [Open the Card in GIMP](#open-the-card-in-gimp)
- [Print Half-Fold Card](#print-half-fold-card)
- [Print Quarter-Fold Card](#print-quarter-fold-card)

## Overview

Somehow, with all the [open source](https://en.wikipedia.org/wiki/Open_source) applications available from [Apt](https://wiki.debian.org/Apt), options for easily printing greeting cards are sparse. Since I love [GIMP](https://www.gimp.org/), I decided I could easily just make the contents of a card there, then run a script to print it using [CLI](https://en.wikipedia.org/wiki/Command-line_interface) tools. The below contents outline my method for printing a greeting card this way.

## Install Dependencies

### [ImageMagick](https://imagemagick.org/)

```bash
sudo apt build-dep imagemagick
wget https://www.imagemagick.org/download/ImageMagick.tar.gz
tar xf ImageMagick.tar.gz
cd ImageMagick-7*
./configure
make
sudo make install
```

## Download the Template

### Via Browser

[Github](https://github.com/efournier92/Notes/blob/master/GreetingCards/GreetingCardTemplate.zip)

### Via [cURL](https://curl.haxx.se/)

```bash
wget https://raw.githubusercontent.com/efournier92/Notes/master/GreetingCards/GreetingCardTemplate.zip
```

## Unzip the Directory

```bash
unzip GreetingCardTemplate.zip
cd GreetingCardTemplate
```

## Open the Card in GIMP

```bash
gimp *.xcf
```

## Print Half-Fold Card

```bash
bash print-half-fold.bash
```

## Print Quarter-Fold Card

```bash
bash print-quater-fold.bash
```

