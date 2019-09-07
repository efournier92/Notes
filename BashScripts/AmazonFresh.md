# Amazon Fresh Script

## Description


## Script

```bash
#!/bin/bash

SEARCH="https://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Damazonfresh&field-keywords="
HOMEPAGE="https://www.amazon.com/AmazonFresh/"

google-chrome --new-window $HOMEPAGE \
-d "${SEARCH}lettuce" \
-d "${SEARCH}potatoes" \
-d "${SEARCH}bell+pepper" \
-d "${SEARCH}kraft+dressing" \
-d "${SEARCH}blackberries" \
-d "${SEARCH}croutons" \
-d "${SEARCH}cashews" \
-d "${SEARCH}tortilla+chips" \
-d "${SEARCH}salsa" \
-d "${SEARCH}kerrygold+cheese" \
-d "${SEARCH}cabot+shredded" \
-d "${SEARCH}whacky+mac" \
-d "${SEARCH}dried+fruit" \
-d "${SEARCH}water+320" \
-d $HOMEPAGE
```

