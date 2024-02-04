def stronk_password(password):
    special_characters = "!@#$%^&*()-_=+[]{}|;:'\",.<>/?"
    if len(password) < 8:
        return False
    if not any(character.isupper() for character in password):
        return False
    if not any(character.islower() for character in password):
        return False
    if not any(character.isdigit() for character in password):
        return False
    if not any(character in special_characters for character in password):
        return False

    # If all requirements are meant
    return True


password_input = input("Enter password: ")
if stronk_password(password_input):
    print("Password stronk")
else:
    print("Ya goofed, the password is weak")
