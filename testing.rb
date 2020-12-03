module Enumerable
  def my_all?(param = nil)
    arr = to_a
    if block_given?
      arr.length.times { |i| return false unless yield(arr[i]) }
    elsif !param.nil?
      return false if arr.grep(param) != arr
    else
      arr.length.times { |i| return false if arr[i].nil? || arr[i] == false }
    end
    true
  end
end
