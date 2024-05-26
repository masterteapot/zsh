#!/bin/bash

# This function does a search

function ddg() {
  query=$1
  clean_query="${query// /+}"
  firefox -new-tab "https://duckduckgo.com/?t=ffab&q=${clean_query}" &
}
