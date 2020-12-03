module Enumerable
  def my_each
    return enum_for unless block_given?

    arr = to_a
    (0..arr.length - 1).each do |i|
      yield(arr[i])
    end
    self
  end

  
end

#p (1..4).each{ |x| x }               # 1..3
#p (1..4).my_each{ |x| x }             # 0..2

p (1..3).each_with_index{ |x| x }               # 1..3
p (1..3).my_each_with_index{ |x| x }             # 0..2
