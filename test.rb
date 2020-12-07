module Enumerable
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
