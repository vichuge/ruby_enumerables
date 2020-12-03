module Enumerable
  def my_count(param = nil)
    arr = to_a
    elem = 0
    if block_given?
      arr.length.times { |i| elem += 1 if yield(arr[i]) }
    elsif !param.nil?
      arr.length.times { |i| elem += 1 if arr[i] == param }
    else
      arr.length.times { |_| elem += 1 }
    end
    elem
  end
end

ary = [1, 2, 4, 2, 5, 2]
p ary.my_count                  #=> 6
p ary.my_count(2)               #=> 3
p ary.my_count { |x| x%2 == 0 } #=> 4
p [3,2,1,0,1,1,1].my_count{|x| x >= 2} #=> 2