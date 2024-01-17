#!/bin/bash

signature="
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢠⣤⣤⣤⣤⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣤⣔⣭⠗⠚⢢⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠈⡇⡖⣲⣯⣩⡙⠻⠿⣷⠾⠫⠋⣻⣻⡉⠁⠈⣠⣴⣲⡿⣿⣿⣿⣧⠀⢃⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢳⣳⠹⣿⡿⠿⣷⣶⣧⠶⢲⣾⠿⣽⢷⡷⠋⠿⣧⣿⣠⣾⣿⣿⣿⠇⣧⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠈⠫⣳⣌⢿⣮⢟⡥⠉⠀⢰⠋⠀⣳⠟⠀⠀⠀⠈⠙⠻⣿⣿⠿⢋⣼⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠓⣎⣿⢋⢬⡙⡄⠀⠞⢀⣴⣯⣀⣤⣄⡀⠀⠀⠀⠀⠛⣷⣿⠈⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢠⢏⢇⡬⠳⢏⠉⢻⠀⡟⢁⣵⣇⣠⣈⠈⠉⠓⢦⣄⡸⢄⡈⠻⢄⢹⣶⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣠⠮⢛⣁⣬⣷⣾⣧⣏⣲⣿⠾⠛⠛⣛⠛⠻⣶⣤⣀⣁⡉⠿⢷⣤⣄⡀⠙⢶⡶⠀⠀⠀⠀⠀
⠀⠀⠀⣧⣺⠁⠀⠀⠀⠀⢹⣿⡷⣇⠀⠀⠀⠈⠉⠓⢹⣾⣷⣶⣾⣐⡤⣉⠙⠯⣀⠀⠘⢻⣅⡀⠀⠀
⢀⣠⡲⣫⣿⣄⠀⠀⠀⠀⣼⠟⠈⠻⣿⡀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣶⣱⢦⡿⣖⢄⠐⣽⡟⠀⠀
⣰⠟⠴⣿⣿⣿⣷⣄⣠⣴⢯⣖⠉⡶⠛⢿⣶⣦⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠉⣹⠧⠼⡿⠃⠀⠀⠀
⠙⠷⣌⡻⣿⣿⣿⣿⣿⢱⣿⣿⣿⡆⠀⠀⢉⡻⢿⣿⣿⣿⣿⣿⠿⣟⣿⣶⡾⢯⣑⠻⣹⠃⠀⠀⠀⠀
⠀⠀⠀⠛⠚⠭⣟⣿⡟⣢⣝⣻⣍⣠⠤⢴⣛⣉⣀⣠⣍⣿⣿⣾⣿⣿⣟⢥⡞⢠⣫⡾⢧⡀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠐⠛⢙⣿⣿⣭⣥⣶⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⡷⠚⠉⠀⢀⠉⡳⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣴⣏⣯⠜⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢯⣿⠿⢊⡥⠖⠚⢹⣭⡁⣼⠇⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⣼⣿⠁⠀⣾⣿⣿⣿⣿⣿⣿⣿⠻⣷⡼⢋⡠⠖⠉⣀⣴⣾⣿⢋⣛⣿⡆⠀⠀⠀
⠀⠀⠀⠀⠀⡠⣞⣵⣷⢹⠀⢠⣿⣿⡿⣿⣿⣿⠟⡞⣳⢋⠞⣋⣤⣶⣿⣿⣿⣿⣿⡿⡿⢿⣿⣷⡄⠀
⠀⠀⠀⠀⣼⣰⢻⣿⣿⡏⣧⢸⣿⡷⡿⠋⣿⡯⠋⡴⣳⣷⣿⣿⣿⡻⢷⣿⣿⢟⡟⢆⠈⢫⡻⣿⣷⠀
⠀⠀⢀⣜⠟⡇⣿⣿⣿⣿⡿⣾⣿⠟⣱⣿⡏⣠⡎⣏⣿⢯⣿⣿⣿⣿⣿⣿⡏⠈⠀⠨⣷⠭⣟⡼⣿⡀
⠀⣠⣺⣋⣀⣷⣿⣿⣿⣿⣇⣿⣿⣧⣟⣿⣿⣿⢨⣿⢁⣾⣿⣿⣿⣿⣿⣳⠃⢀⡴⠊⠁⠀⠀⡇⣾⣧
"
line="_______________________________________"

while true; do

    echo "===================================="
    echo "| ~ Welcome to Guess the Number! ~ |"
    echo "===================================="

    attempts_difficulty=0

    # Loop to allow three attempts to choose the difficulty level
    while [ $attempts_difficulty -lt 3 ]; do
        # Prompt the user for the difficulty level
        read -p "Choose difficulty (easy/hard): " difficulty

        # Validate the input
        if [[ "$difficulty" == "easy" || "$difficulty" == "hard" ]]; then
            break
        else
            echo "Invalid difficulty. Please choose 'easy' or 'hard'."
            ((attempts_difficulty++))
        fi
    done

    # Check if three attempts have been made to choose difficulty
    if [ $attempts_difficulty -eq 3 ]; then
        echo "$signature"
        echo "$line$line"
        echo "You've reached the maximum number of attempts. Exiting the game."
        sleep 5
        exit 1
    fi

    if [ "$difficulty" == "easy" ]; then
        echo "=============================================================="
        echo "| ~  You are playing in easy mode with unlimited guesses. ~  |"
        echo "=============================================================="
    else
        echo "================================================================="
        echo "| ~  You are playing in hard mode with a limit of 10 guesses. ~ |"
        echo "================================================================="
    fi

    # Generate a random number between 1 and 100
    secret_number=$((RANDOM % 100 + 1))

    attempts=0
    max_attempts_hard=10   # Limit guesses to 10 in hard mode

    echo "====================================================================================="
    echo "| ~ I'm thinking of a number between 1-100. Enter q at anytime to end the program ~ |"
    echo "====================================================================================="

    while true; do
        read -p "Your guess (or 'q' to quit): " guess

        # Check if the player wants to quit
        if [ "$guess" == "q" ]; then

            echo "$signature"
            echo "$line"
            echo "Thanks for playing! Exiting the game."
            sleep 5
            exit 0
        fi

        # Validate input as a number
        if [[ ! "$guess" =~ ^[0-9]+$ ]]; then
            echo "Careful on the input. Please enter a valid number."
            continue
        fi

        ((attempts++))

        # Check if the guess is correct
        if (( guess == secret_number )); then
            echo "****************************************************************"
            echo "|  Congratulations! You guessed the number in $attempts attempts.  |"
            echo "****************************************************************"
            break
        elif (( guess < secret_number )); then
            if (( secret_number - guess <= 5 )); then
                echo "Too low, but you're close! Try again."
            else
                echo "Too low. Try again."
            fi
        else
            if (( guess - secret_number <= 5 )); then
                echo "Too high, but you're close! Try again."
            else
                echo "Too high. Try again."
            fi
        fi

        # Check difficulty and limit the number of attempts in hard mode
        if [ "$difficulty" == "hard" ] && (( attempts >= max_attempts_hard )); then
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo "Sorry, you've reached the maximum number of attempts. The correct number was $secret_number."
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            break
        fi
    done

    # Ask the user if they want to play again
    read -p "Do you want to play again? (yes/no): " play_again

    if [ "$play_again" != "yes" ]; then
        echo "$signature"
        echo "$line"
        echo "Thanks for playing! Exiting the game."
        sleep 5
        exit 0
    fi
done
