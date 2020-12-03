if room_tidy == true
    "I can play video games"
end

if statement_to_be_evaluated == true
  # do something awesome...
end

if 1 < 2
    puts "Hot diggity, 1 is less than 2!"
  end
  #=> Hot diggity, 1 is less than 2!

#one line
puts "Hot diggity damn, 1 is less than 2" if 1 < 2

#else
if attack_by_land == true
    puts "release the goat"
  else
    puts "release the shark"
end

#elif
if attack_by_land == true
  puts "release the goat"
elsif attack_by_sea == true
  puts "release the shark"
else
  puts "release Kevin the octopus"
end

#Boolean logic
5 == 5 #=> true
5 == 6 #=> false

5 != 7 #=> true
5 != 5 #=> false

7 > 5 #=> true
5 > 7 #=> false

5 < 7 #=> true
7 < 5 #=> false

7 >= 7 #=> true
7 >= 5 #=> true

5 <= 5 #=> true
5 <= 7 #=> true

5.eql?(5.0) #=> false; although they are the same value, one is an integer and the other is a float
5.eql?(5)   #=> true

a = 5
b = 5
a.equal?(b) #=> true

a = "hello"
b = "hello"
a.equal?(b) #=> false
#This happens because computers can’t store strings in the same efficient way they store numbers. Although the values of the variables are the same, the computer has created two separate string objects in memory.

5 <=> 10    #=> -1 
10 <=> 10   #=> 0
10 <=> 5    #=> 1
#-1 if the value on the left is less than the value on the right;
#0 if the value on the left is equal to the value on the right; and
#1 if the value on the left is greater than the value on the right.

#and operator
if 1 < 2 && 5 < 6
  puts "Party at Kevin's!"
end

# This can also be written as
if 1 < 2 and 5 < 6
  puts "Party at Kevin's!"
end

#or operator
if 10 < 2 || 5 < 6 #=> although the left expression is false, there is a party at Kevin's because the right expression returns true
  puts "Party at Kevin's!"
end

# This can also be written as
if 10 < 2 or 5 < 6
  puts "Party at Kevin's!"
end

if !false     #=> true
if !(10 < 5)  #=> true

#case
grade = 'F'

did_i_pass = case grade #=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in
  when 'A' then "Hell yeah!"
  when 'D' then "Don't tell your mother."
  else "McDonald's is hiring!"
end

#More complex case 
grade = 'F'

case grade
when 'A'
  puts "You're a genius"
  future_bank_account_balance = 5_000_000
when 'D'
  puts "Better luck next time"
  can_i_retire_soon = false
else
  puts "McDonald's is hiring!"
  fml = true
end

#Unless
#An unless statement works in the opposite way as an if statement: it only processes the code in the block if the expression evaluates to false. There isn’t much more to it.
age = 18
unless age < 17
  puts "Get a job."
end

age = 18
puts "Welcome to a life of debt." unless age < 17

unless age < 17
  puts "Down with that sort of thing."
else
  puts "Careful now!"
end

#Ternary operator
age = 18
response = age < 17 ? "You still have your entire life ahead of you." : "You're all grown up."
puts response #=> "You're all grown up."

