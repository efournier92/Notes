# Open Chrome Tabs

## Description
The following is a quick-and-dirty approach to opening a fresh [`Chrome`](https://www.google.com/chrome/), while loading a specific set of app tabs.

## Amazon Fresh
The below example opens a window with several tabs, each a different product on [Amazon Fresh](https://www.amazon.com/AmazonFresh), to make for a faster shopping experience.

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

