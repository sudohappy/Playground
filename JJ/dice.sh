#!/bin/bash
# version 8.2

# Bigger dice faces
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

# ASCII art sushi
sushi_art="
.............../\.................................................
............../  \................/\..............................
............./    \............../  \.............................
............/      \............/    \............................
.........../        \........../      \________________...........
........../                                .%...       \..........
...........     . .              . .                    \.........
..........    .     .          .     .                   \........
.........    .       .        .       .                   %.......
........%                                                 ,//**...
....%///,/              / \                               %/**....
..,////*    ,                     \                       %*///...
.*/////*,*//////\/             (      \%%_________////,,,*//////..
../////,,*/////*,*///////*,,*//     %_____________\/,,,//////////.
..  %//,,//////*,*///////,,*////////\______________,,*////////%...
.(       .%/////**//////*,,//////////______________            ,..
..               .(%(///**,///////(\%______________            ...
.                                    ______________            ...
.                                    ______________            ...
..                                   ______________            ...
...\                                 ______________           ....
......(                              _____________     ...........
............                        ____________..................
................./................((\.............................
"

logo="
  ===============================
|| ####  #    #  ####  #    # # ||
||#      #    # #      #    # # ||
|| ####  #    #  ####  ###### # ||
||     # #    #      # #    # # ||
||#    # #    # #    # #    # # ||
|| ####   ####   ####  #    # # ||
  ==============================
"

# Function to print a better representation of a dice face
print_dice_face() {
    local dice_value=$1

    case $dice_value in
        1) echo "${bigger_dice_faces[0]}";;
        2) echo "${bigger_dice_faces[1]}";;
        3) echo "${bigger_dice_faces[2]}";;
        4) echo "${bigger_dice_faces[3]}";;
        5) echo "${bigger_dice_faces[4]}";;
        6) echo "${bigger_dice_faces[5]}";;
    esac
}

echo "$logo"
echo "Welcome to the Dice Rolling Game!"

# Ask the user for the target number
read -p "Enter the target number (1-6): " target_number

# Validate the target number
if (( target_number < 1 || target_number > 6 )); then
    echo "Error: Invalid target number. Exiting."
    exit 1
fi

echo "Press 'Enter' to roll the dice. Type 'x' to exit the game."

# Score tracking
total_rolls=0
successful_rolls=0

while true; do
    # Rolling animation with bigger dice faces
    echo -n "Rolling... "
    for i in {1..5}; do
        echo -ne "\033[1K\rRolling: ${bigger_dice_faces[((RANDOM % 6))]} "
        sleep 0.2
    done

    # Generate a random number between 1 and 6 for the dice roll
    dice_roll=$((RANDOM % 6 + 1))

    # Play a dice rolling sound
    echo -e "\a"

    # Display the customized face
    echo -e "\033[1K\rYou rolled:"
    print_dice_face $dice_roll

    # Score tracking
    ((total_rolls++))
    if [ $dice_roll -eq $target_number ]; then
        ((successful_rolls++))
        echo "Congratulations! This roll met your target."
    fi

    # After the loop
    echo "Total Rolls: $total_rolls"
    echo "Success Percentage: $(( (successful_rolls * 100) / total_rolls ))%"
    read -p "Press Enter to roll again, or 'x' to exit..."
    if [[ $REPLY == "x" ]]; then
        break
    fi
done

echo "$sushi_art"
