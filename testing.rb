module Enumerable
  def my_map(proc = nil)
    return enum_for unless block_given? || !proc.nil?

    arr = to_a
    ret = []
    if proc
      arr.length.times { |i| ret << proc.call(arr[i]) }
    else
      arr.length.times { |i| ret.push(yield(arr[i])) }
    end
    ret
  end
end

my_proc = proc { |num| num > 10 }
p [5,6,7,8,9,10,11,12,13].map { |num| num > 10 } # --> should be [false, false, false, true, true]
p [5,6,7,8,9,10,11,12,13].my_map(my_proc) { |num| num < 10 } # --> should be [false, false, false, true, true]