#!/bin/bash
# args: $1: path to mosesdecoder repo root, $2: input file, $3: output file
cat "$2" | python3 dump_title.py \
        | perl "$1/scripts/tokenizer/normalize-punctuation.perl" \
        | perl "$1/scripts/ems/support/split-sentences.perl" \
        | python3 skip_paragraph.py \
        | perl "$1/scripts/tokenizer/tokenizer.perl" -no-escape \
        | python3 postprocessing_title.py > "$3"
