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

  def my_select
    return enum_for unless block_given?

    arr = to_a
    new_a = []
    (0..arr.length - 1).each do |i|
      next unless yield(arr[i])

      new_a << arr[i]
    end
    p new_a
  end

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

  def my_any?(param = nil)
    arr = to_a
    arr.length.times do |i|
      return true if block_given? && yield(arr[i])
      return true unless !param.nil? && arr.grep(param).empty?
      return true if arr[i].nil? || arr[i] == false
    end
    false
  end

  def my_none?(param = nil)
    arr = to_a
    if block_given?
      (0..arr.length - 1).each { |i| return false if yield(arr[i]) }
    elsif !param.nil?
      (0..arr.length - 1).each { |i| return false if arr[i].is_a? param }
    else
      (0..arr.length - 1).each { |i| return false unless arr[i].nil? || arr[i] == false }
    end
    true
  end

  def my_count(param = nil)
    arr = to_a
    elem = 0
    if block_given?
      (0..arr.length).my_each { |i| elem += 1 if yield(i) }
    elsif !param.nil?
      (0..arr.length).my_each { |i| elem += 1 if arr[i] == param }
    else
      (0..arr.length - 1).my_each { |_| elem += 1 }
    end
    elem
  end

  def my_map(proc = nil)
    return enum_for unless block_given?

    arr = to_a
    ret = []
    if block_given?
      (0..arr.length - 1).my_each { |i| ret.push(yield(arr[i])) }
    else
      (0..arr.length - 1).my_each { |i| ret << proc.call(arr[i]) }
    end
    ret
  end

  def my_inject(param = nil)
    arr = to_a
    adding = param.nil? ? 0 : param
    (0..arr.length - 1).my_each { |i| adding = yield(adding, arr[i]) }
    adding
  end

  def multiply_els
    arr = to_a
    start = 1
    (0..arr.length - 1).my_each { |i| start *= arr[i] }
    start
  end
end
