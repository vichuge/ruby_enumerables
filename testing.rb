module Enumerable
  def my_each
    return enum_for unless block_given?

    arr = to_a
    arr.length.times do |i|
      yield(arr[i])
    end
    self
  end

  def my_each_with_index
    return enum_for unless block_given?

    arr = to_a
    arr.length.times do |i|
      yield(arr[i], i)
    end
    self
  end
end

