module Enumerable
  def my_none?(param = nil)
    arr = to_a
    arr.length.times do |i|
      return true if block_given? && yield(arr[i])
      return true unless !param.nil? && arr.grep(param).empty?
      return true if arr[i].nil? || arr[i] == false
    end
    false
  end
end


p %w{ant bear cat}.none? { |word| word.length == 5 } #=> true
p %w{ant bear cat}.none? { |word| word.length >= 4 } #=> false
p %w{ant bear cat}.none?(/d/)                        #=> true
p [1, 3.14, 42].none?(Float)                         #=> false
p [].none?                                           #=> true
p [nil].none?                                        #=> true
p [nil, false].none?                                 #=> true
p [nil, false, true].none?                           #=> false

p ['q', 'qq'].none?(/d/)              # true
p ['d', 'dd'].my_none?(/d/)           # TypeError
p ['e', 'er'].none?("e")              # false
p ['e', 'er'].my_none?("e")           # TypeError