#!/bin/bash

SRC="../deep-limit20"
DEST="./20"

mkdir -p "$DEST"

for i in {1..10}; do
  SRC_RESULT="$SRC/results$i"
  DEST_RESULT="$DEST/results$i"

  [ -d "$SRC_RESULT" ] || continue

  echo "Processando results$i..."

  find "$SRC_RESULT" \
    \( -path "*/ioa/CHA/*" -o -path "*/ioa/SPARK/*" \) \
    -type f \
    ! -name "PANotResolve.csv" \
    ! -name "AnalysisRecords.csv" \
    | while read -r file; do

        rel_path="${file#$SRC/}"
        dest_file="$DEST/$rel_path"

        mkdir -p "$(dirname "$dest_file")"
        cp "$file" "$dest_file"
    done
done

echo "✔ Cópia finalizada."
