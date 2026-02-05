#!/bin/bash

MAX_SIZE=90m

find . \
  -type f \
  \( -name "out.txt" -o -name "conflicts_log.txt" \) \
  | while read -r file; do

    echo "Dividindo $file"

    split -b $MAX_SIZE \
      -d \
      --suffix-length=3 \
      "$file" \
      "$file.part"

    rm "$file"
done

echo "✔ Arquivos divididos"
