#rubocop:disable Metrics/CyclomaticComplexity
#rubocop:disable Metrics/PerceivedComplexity

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
      arr.length.times { |i| return false if yield(arr[i]) }
    elsif !param.nil?
      return false unless arr.grep(param).empty?
    else
      arr.length.times { |i| return false unless arr[i].nil? || arr[i] == false }
    end
    true
  end

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

  def my_inject(st = 0, param = nil)
    return enum_for unless block_given? || !st.nil?

    arr = to_a
    if st.is_a?(Symbol)
      param = st
      st = 0
    end
    if param
      arr.length.times do |i|
        case param
        when :+ then st += arr[i]
        when :- then st -= arr[i]
        when :* then st *= arr[i]
        when :/ then st /= arr[i]
        else return enum_for
        end
      end
    elsif arr[0].is_a?(Integer)
      arr.length.times { |i| st = yield(st, arr[i]) } 
    else
      st = arr[0]
      arr.length.times do |i| 
        st = yield(st, arr[i])
      end
    end
    st
  end

  def multiply_els
    arr = to_a
    result = 1
    arr.length.times { |i| result *= arr[i] }
    result
  end
end

#rubocop:enable Metrics/CyclomaticComplexity
#rubocop:enable Metrics/PerceivedComplexity