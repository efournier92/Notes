# PDF Mastering

## Image to Text

tesseract -l eng Page_00.png OUT_00.png

## Turn Black & White

### Better

convert Page_01.png -monochrome Page_01_OUT.png                 

### Worse

convert <input> -remap pattern:gray50 <output>

## Mastering

### Print PDF

```
convert Page**.png -background white -page legal -bordercolor white -border 100 OUT_LetterBorders.pdf 
```

