user_input = input("Enter a number: ")

if user_input.replace(".", "").isdigit():
    number_input = float(user_input)
    print("You entered: ", number_input)
else:
    print("You goofed, try again with actual numbers")
