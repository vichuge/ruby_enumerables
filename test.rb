module Enumerable
  def my_inject(sta = 0, param = nil)
    return enum_for unless block_given? || !sta.nil?

    arr = to_a
    param = sta if sta.is_a?(Symbol)
    sta = 0 if sta.is_a?(Symbol)
    if param
      arr.length.times do |i|
        case param
        when :+ then sta += arr[i]
        when :- then sta -= arr[i]
        when :* then sta *= arr[i]
        when :/ then sta /= arr[i]
        else return enum_for
        end
      end
    elsif arr[0].is_a?(Integer)
      arr.length.times do |i|
        sta = arr[0] if i.zero?
        sta = yield(sta, arr[i]) unless i.zero?
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

 p (5..10).my_inject { |sum, n| sum + n }            #=> 45
 p (5..10).my_inject(1) { |product, n| product * n } #=> 151200
# p (5..10).multiply_els
 p longest = [3, 4, 5, 10, 77].my_inject { |num1, num2| num1 > num2 ? num1 : num2 } #=> 77

range = Range.new(5, 50)
p actual = range.my_inject { |prod, n| prod * n }
p expected = range.inject { |a, b| a * b }
p actual = range.my_inject { |prod, n| prod + n }
p expected = range.inject { |a, b| a + b }
