module Enumerable
  def my_none?(param = nil)
    arr = to_a
    if block_given?
      arr.length.times { |i| return false if yield(arr[i]) }
    elsif !param.nil?
      return false unless arr.grep(param).empty?
    else
      arr.length.times { |i| return false unless arr[i].nil? || arr[i] == false }
    end
    true
  end
end

