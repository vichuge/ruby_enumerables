#=begin
def one_yield
  yield
end

def multiple_yields
  yield
  yield
end

one_yield { puts "one yield" }

multiple_yields { puts "multiple yields" }
#=end

#-----------------------------------------
#=begin

def optional_block
  yield if block_given?
end

optional_block # => nil
optional_block { puts 'optional block' } # => optional block
#=end

#----------------------------------------
#=begin
def yield_with_arguments
  hello_inside = 'Hello'
  world_inside = 'World!'

  yield(hello_inside, world_inside)
end
yield_with_arguments { |hello_outside, world_outside| puts "#{hello_outside} #{world_outside}" } # => Hello World!
#=end