#!/bin/bash

SEARCH="https://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Damazonfresh&field-keywords="
HOMEPAGE="https://www.amazon.com/AmazonFresh/"

google-chrome --new-window $HOMEPAGE \
-d "${SEARCH}cashews" \
-d "${SEARCH}whole+foods+salad" \
-d "${SEARCH}vegetable+rotini" \
-d "${SEARCH}kerrygold+cheese" \
-d "${SEARCH}cabot+shredded" \
-d "${SEARCH}lettuce" \
-d "${SEARCH}bell+pepper" \
-d "${SEARCH}croutons" \
-d "${SEARCH}bacon+bits" \
-d "${SEARCH}pineapple+chunks" \
-d "${SEARCH}watermelon" \
-d "${SEARCH}blackberries" \
-d "${SEARCH}kraft+dressing" \
-d $HOMEPAGE

