module Enumerable
  def my_all?(param = nil)
    arr = to_a
    if block_given?
      arr.length.times { |i| return false unless yield(arr[i]) }
    elsif !param.nil?
      arr.length.times { |i| return false unless arr[i].is_a? param }
    else
      arr.length.times { |i| return false if arr[i].nil? || arr[i] == false }
    end
    true
  end
end

p [1,false,3].all?               # false
p [1,false,3].my_all?            # true

p %w{ant bear catas}.my_all? { |word| word.length == 5 }
p %w[ant bear cat].my_all? { |word| word.length >= 3 }
p %w[ant bea cat].my_all? { |word| word.length >= 4 }
p [1, 2i, 3.14].my_all?(Numeric)
p ['p', 2i, 3.14].my_all?(Numeric)
p %w[p n s].my_all?(Numeric)
p [nil, true, 99].my_all?
p [].my_all?
p [nil, nil].my_all?
p [nil, false].my_all?
p [nil, false, true].my_all?