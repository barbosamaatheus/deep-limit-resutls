#!/bin/bash

find . \
  -type f \
  \( -name "out.txt.part000" -o -name "conflicts_log.txt.part000" \) \
  | while read -r part0; do

    base="${part0%.part000}"

    echo "Reconstruindo $base"

    cat "${base}.part"* > "$base"
done

echo "✔ Arquivos reconstruídos"
