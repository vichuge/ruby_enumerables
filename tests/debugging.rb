irb(main):001:0> def double_words_in_phrase(string)
irb(main):002:1>   string_array = string.split(' ')
irb(main):003:1>
irb(main):004:1>   p string_array
irb(main):005:1>
irb(main):006:1>   string_array.map { |word| word * 2 }
irb(main):007:1>   p string_array
irb(main):008:1>   string_array.join(' ')
irb(main):009:1> end
=> :double_words_in_phrase

irb(main):010:0> double_words_in_phrase("This is a test")
["This", "is", "a", "test"]
["This", "is", "a", "test"]
=> "This is a test"

