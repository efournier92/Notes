#!/bin/bash

search_url="https://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Damazonfresh&field-keywords="
homepage="https://www.amazon.com/AmazonFresh/"

google-chrome-stable --new-window $homepage \
-d "${search_url}lettuce" \
-d "${search_url}potatoes" \
-d "${search_url}bell+pepper" \
-d "${search_url}kraft+dressing" \
-d "${search_url}blackberries" \
-d "${search_url}croutons" \
-d "${search_url}cashews" \
-d "${search_url}tortilla+chips" \
-d "${search_url}salsa" \
-d "${search_url}kerrygold+cheese" \
-d "${search_url}cabot+shredded" \
-d "${search_url}whacky+mac" \
-d "${search_url}dried+fruit" \
-d "${search_url}water+320" \
-d $homepage

