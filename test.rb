module Enumerable
  def my_any?(param = nil)
    arr = to_a
    arr.length.times do |i|
      return true if block_given? && yield(arr[i])
      return true if !param.nil? && arr[i].is_a?(param)
      return true if arr[i].nil? || arr[i] == false
    end
    false
  end
end

#p %w[ant bear catas].my_any? { |word| word.length == 5 }
#p %w[ant bear cat].my_any? { |word| word.length >= 3 }
#p %w[ant bea cat].my_any? { |word| word.length >= 4 }
#p [1, 2i, 3.14].my_any?(Numeric)
#p ['p', 2i, 3.14].my_any?(Numeric)
p %w[p n s].my_any?(Numeric)
#p [nil, true, 99].my_any?
#p [].my_any?
#p [nil, nil].my_any?
#p [nil, false].my_any?
#p [nil, false, true].my_any?

false_block = proc { |num| num > 9 }
array = Array.new(100) { rand(0...9) }
p array.my_any?(&false_block)    # => false
array.any?(&false_block)    # => false