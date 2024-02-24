# ↓↓↓ formula Function ↓↓↓ 
def add(a, b)
    a + b
  end
  
  def subtract(a, b)
    a - b
  end
  
  def multiply(a, b)
    a * b
  end
  
  def divide(a, b)
      a / b
  end
# ^^^ Function section ^^^

# ↓↓↓ menu ↓↓↓ 
loop do
    print "Calculator Application\n"
    puts "-" * 22

# ↓↓↓ options ↓↓↓ 
    print "1. + \n2. - \n3. * \n4. / \n5. Quit \nEnter yout choice: "
    choice = gets.chomp
# ^^^ options ^^^

# ^^^ menu ^^^
    break if choice == "5"
    #    exit loop

    print "Enter first number: "
    num1 = gets.chomp.to_i
    print "Enter second number: "
    num2 = gets.chomp.to_i 
# .to_i to convert string to integer

# or ||
    if choice == "1" ||  choice == "+"
        puts "Result: #{add(num1, num2)}"
    elsif choice == "2" || choice == "-"
        puts "Result: #{subtract(num1, num2)}"
    elsif choice == "3" || choice == "*"
        puts "Result: #{multiply(num1, num2)}"
    elsif choice == "4" || choice == "/"
        puts "Result: #{divide(num1, num2)}"
    else
        puts "Invalid choice!"
    end
end
puts "Exit successfully"