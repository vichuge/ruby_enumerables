#method
def my_name
    "Joe Smith"
end

puts my_name    #=> "Joe Smith"

#method names
method_name      # valid
_name_of_method  # valid
1_method_name    # invalid
method_27        # valid
method?_name     # invalid
method_name!     # valid
begin            # invalid (Ruby reserved word)
begin_count      # valid

#Parameters and arguments
def greet(name) #name is a parameter, John is an argument
    "Hello, " + name + "!"
end

#Default parameters
puts greet("John") #=> Hello, John! 

def greet(name = "stranger")
    "Hello, " + name + "!"
  end
  puts greet("Jane") #=> Hello, Jane!
  puts greet #=> Hello, stranger!

#Methos returns
def my_name
    "Joe Smith"
  end
puts my_name #=> "Joe Smith"

def my_name
    return "Joe Smith"
  end
puts my_name #=> "Joe Smith"

def even_odd(number)
    if number % 2 == 0
      "That is an even number."
    else
      "That is an odd number."
    end
  end
puts even_odd(16) #=>  That is an even number.
puts even_odd(17) #=>  That is an odd number.

def my_name
    return "Joe Smith"
    "Jane Doe"
  end
puts my_name #=> "Joe Smith"

def even_odd(number)
    unless number.is_a? Numeric
      return "A number was not entered."
    end
  
    if number % 2 == 0
      "That is an even number."
    else
      "That is an odd number."
    end
  end
puts even_odd(20) #=>  That is an even number.
puts even_odd("Ruby") #=>  A number was not entered.

#puts is a method that prints whatever argument you pass it to the console.
#return is the final output of a method that you can use in other places throughout your code.

#Print the value with put, but no return the value (return)
def puts_squared(number)
  puts number * number
end

x = return_squared(20) #=> 400
y = 100
sum = x + y #=> 500
puts "The sum of #{x} and #{y} is #{sum}."
#=> The sum of 400 and 100 is 500.

#Chaining methods
phrase = ["be", "to", "not", "or", "be", "to"]
puts phrase.reverse.join(" ").capitalize
#=> "To be or not to be"

#The steps
["be", "to", "not", "or", "be", "to"].reverse
= ["to", "be", "or", "not", "to", "be"].join(" ")
= "to be or not to be".capitalize
= "To be or not to be"

#even=par odd=impar
puts 5.even?  #=> false
puts 6.even?  #=> true
puts 17.odd?  #=> true
puts 12.between?(10, 15)  #=> true

#bang methods
whisper = "HELLO EVERYBODY"
puts whisper.downcase #=> "hello everybody"
puts whisper #=> "HELLO EVERYBODY"

#Adding ! it changes
puts whisper.downcase! #=> "hello everybody"
puts whisper #=> "hello everybody"