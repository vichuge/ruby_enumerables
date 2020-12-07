# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/ModuleLength
# rubocop:disable Metrics/MethodLength

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
      return true if param.is_a?(Class) && arr[i].is_a?(param)
      return true if param.instance_of?(Regexp) && arr[i].to_s.match(param.to_s)
      return true if arr[i] == true
      return true if arr[i].is_a?(Array)
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

  def my_inject(sta = 0, param = nil)
    return enum_for unless block_given? || !sta.nil?

    arr = to_a
    param = sta if sta.is_a?(Symbol)
    sta = 0 if sta.is_a?(Symbol)
    if param
      arr.length.times do |i|
        sta = arr[0] if i.zero? && sta.zero?
        case param
        when :+ then sta += arr[i] unless i.zero?
        when :- then sta -= arr[i] unless i.zero?
        when :* then sta *= arr[i] unless i.zero?
        when :/ then sta /= arr[i] unless i.zero?
        else return enum_for
        end
      end
    elsif arr[0].is_a?(Integer)
      arr.length.times do |i|
        sta = yield(sta, arr[i])
      end
    else
      sta = arr[0]
      arr.length.times do |i|
        sta = yield(sta, arr[i])
      end
    end
    sta
  end
end

def multiply_els(elements)
  elements.my_inject { |one, two| one * two }
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/ModuleLength
# rubocop:enable Metrics/MethodLength
