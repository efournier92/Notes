# Excel Commands

## Functions

### Trim by keyword in text cell

```excel
=MID(B2, FIND("gmt",B2) + 7, FIND("""",B2,FIND("""",B2)-1) - FIND("""",B2) + 36)
```

