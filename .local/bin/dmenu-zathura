#!/bin/sh

booksPath="/mnt/1TB/Books/"

path=$(ls /mnt/1TB/Books/ | dmenu -i -l 10)

if [[ ${path} ]]; then
  book=$(ls "$booksPath$path" | dmenu -i -l 10)
  if [[ ${book} ]]; then
    zathura "$booksPath$path/$book"
  fi
fi

exit 0
