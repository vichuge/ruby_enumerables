module Enumerable
  def my_any?(param = nil)
    arr = to_a
    exist_falses = false
    arr.length.times do |i|
      return true if block_given? && yield(arr[i])
      return true if param.is_a?(Class) && arr[i].is_a?(param)
      return true if param.instance_of?(Regexp) && arr[i].to_s.match(param.to_s)
      return false && exist_falses = true if arr[i] == false
    end
    return false if arr.empty?
    return true if exist_falses == false && !block_given? && param.nil?

    false
  end
end

#p %w[ant bear cat].any?(/d/)
p %w[ant bear cat].my_any?(/d/)
p %w[ant bear catd].my_any?(/d/)
#=begin
p %w{ant bear catas}.my_any? { |word| word.length == 5 } #=>true
p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=>true
p %w[ant bea cat].my_any? { |word| word.length >= 4 } #=>false
p [1, 2i, 3.14].my_any?(Numeric) #=>true
p ['p', 2i, 3.14].my_any?(Numeric) #=>true
p %w[p n s].my_any?(Numeric) #=>false
p [nil, true, 99].my_any? #=>true
p [].my_any? #=>false
p [nil, nil].my_any? #=>true
p [nil, false].my_any? #=>false
p [nil, false, true].my_any? #=>false
#=end