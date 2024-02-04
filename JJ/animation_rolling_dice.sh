#!/bin/bash

# Customized dice faces
faces=("⚀" "⚁" "⚂" "⚃" "⚄" "⚅")
: '
bigger_dice_faces=(
"
┌───────┐
│       │
│   ●   │
│       │
└───────┘
"
"
┌───────┐
│ ●     │
│       │
│     ● │
└───────┘
"
"
┌───────┐
│ ●     │
│   ●   │
│     ● │
└───────┘
"
"
┌───────┐
│ ●   ● │
│       │
│ ●   ● │
└───────┘
"
"
┌───────┐
│ ●   ● │
│   ●   │
│ ●   ● │
└───────┘
"
"
┌───────┐
│ ●   ● │
│ ●   ● │
│ ●   ● │
└───────┘
"
)
'

# Rolling animation for small dice faces
for i in {1..10}; do
    echo -ne "\rRolling: ${faces[((RANDOM % 6))]} "
    sleep 0.2
done

echo -e "\nFinished rolling!"

