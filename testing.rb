module Enumerable
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
end

p (5..10).my_inject { |sum, n| sum + n }            #=> 45
p (5..10).inject { |sum, n| sum + n }            #=> 45
p (5..10).inject(1) { |product, n| product * n } #=> 151200
p (5..10).my_inject(1) { |product, n| product * n } #=> 151200
p longest = [3, 4, 5, 10, 77].inject { |num1, num2| num1 > num2 ? num1 : num2 } #=> 77
p longest = [3, 4, 5, 10, 77].my_inject { |num1, num2| num1 > num2 ? num1 : num2 } #=> 77

p [1, 2, 3].inject(2, :*) #=> 12
p [1, 2, 3].my_inject(2, :*) #=> 12
p [2, 3, 4].inject(:+) #=> 9
p [2, 3, 4].my_inject(:+) #=> 9
p ["rod", "blade", "qq"].inject{ |memo, word| memo.length > word.length ? memo : word } #=> "blade"
p ["rod", "blade", "qq"].my_inject{ |memo, word| memo.length > word.length ? memo : word } #=> "blade"
