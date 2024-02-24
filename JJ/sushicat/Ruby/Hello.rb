# puts method stands for "put string"
    # to output a string to the console with a newline character (\n) at the end
# name = gets.chomp [get] reads the user's input from the keyboard. 
                # The [.chomp] method removes the newline character from the end of the input
# When Ruby sees #{} inside a string, 
    # it knows to replace everything inside #{} with the actual value of the expression

gif = File.join(__dir__, 'img', 'cateatsushigif.gif')

print "Enther your name: "
name = gets.chomp

puts "Hello! #{name}"
puts <<-'EOF'
 /\_/\  
( o.o ) 
 > ^ <
EOF
