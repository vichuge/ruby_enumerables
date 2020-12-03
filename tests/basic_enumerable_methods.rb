#basic
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

for friend in friends do
  if friend != 'Brian'
  invited_list.push(friend)
  end
end

invited_list #=> ["Sharon", "Leo", "Leila", "Arun"]

#easier
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.select { |friend| friend != 'Brian' }
#=> ["Sharon", "Leo", "Leila", "Arun"]

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.reject { |friend| friend == 'Brian' }
#=> ["Sharon", "Leo", "Leila", "Arun"]

#each method
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.each { |friend| puts "Hello, " + friend }
#=> Hello, Sharon
#=> Hello, Leo
#=> Hello, Leila
#=> Hello, Brian
#=> Hello, Arun
#=> ["Sharon", "Leo", "Leila", "Brian" "Arun"]

#each method complex
my_array = [1, 2]
my_array.each do |num|
  num *= 2
  puts "The new number is #{num}."
end
#=> The new number is 2.
#=> The new number is 4.
#=> [1, 2]

#each with hashes
my_hash = { "one" => 1, "two" => 2 }
my_hash.each { |key, value| puts "#{key} is #{value}" }
one is 1
two is 2
#=> { "one" => 1, "two" => 2}
my_hash.each { |pair| puts "the pair is #{pair}" }
the pair is ["one", 1]
the pair is ["two", 2]
#=> { "one" => 1, "two" => 2}

#This doesn't work
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.each { |friend| friend.upcase }
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

#each_with_index method
fruits = ["apple", "banana", "strawberry", "pineapple"]
fruits.each_with_index { |fruit, index| puts fruit if index.even? }
#=> apple
#=> strawberry
#=> ["apple", "banana", "strawberry", "pineapple"]

#Uppercase with map method
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
shouting_at_friends = []
friends.each { |friend| shouting_at_friends.push(friend.upcase) }
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
shouting_at_friends #=> ['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

#map with gsub
my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']
my_order.map { |item| item.gsub('medium', 'extra large') }
#=> ["extra large Big Mac", "extra large fries", "extra large milkshake"]

salaries = [1200, 1500, 1100, 1800]
salaries.map { |salary| salary - 700 }
#=> [500, 800, 400, 1100]

#Select method (bigger and simplified)
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []
friends.each do |friend|
  if friend != 'Brian'
    invited_list.push(friend)
  end
end
invited_list
#=> ["Sharon", "Leo", "Leila", "Arun"]

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.select { |friend| friend != 'Brian' }
#=> ["Sharon", "Leo", "Leila", "Arun"]

responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
responses.select { |person, response| response == 'yes'}
#=> {"Sharon"=>"yes", "Arun"=>"yes"}

#reduce method
my_numbers = [5, 6, 7, 8]
sum = 0
my_numbers.each { |number| sum += number }
sum
#=> 26

my_numbers = [5, 6, 7, 8]
my_numbers.reduce { |sum, number| sum + number }
#=> 26

#Passing a value
my_numbers = [5, 6, 7, 8]
my_numbers.reduce(1000) { |sum, number| sum + number }
#=> 1026

#Counting votes
votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]
votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end
#=> {"Bob's Dirty Burger Shack"=>2, "St. Mark's Bistro"=>1}

hundreds = Hash.new(100)
hundreds["first"]         #=> 100
hundreds["mine"]          #=> 100
hundreds["yours"]         #=> 100

hundreds = Hash.new(100)
hundreds["new"]           #=> 100
hundreds["new"] = 99
hundreds["new"]           #=> 99

#Bang methods

#Here, the original hash doesn't change
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

#Here it changes
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.map! { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
friends
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

#Return values of enumerables (function)
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_friends = friends.select { |friend| friend != 'Brian' }
friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_friends
#=> ["Sharon", "Leo", "Leila", "Arun"]

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
def invited_friends(friends)
  friends.select { |friend| friend != 'Brian' }
end
friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_friends(friends)
 #=> ["Sharon", "Leo", "Leila", "Arun"]