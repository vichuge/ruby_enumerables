def bubble_sort(arr)
    run = arr.length - 2
    arr.each do |num|
        arr.each_with_index do |num2, index|
          if arr[index + 1].nil? == false
            if arr[index] > arr[index + 1] 
              temp = arr[index]
              arr[index] = arr[index + 1]
              arr[index + 1] = temp
            end
          end
        end
        run -= 1
    end
  arr
end
  
def bubble_sort_by(arr)
  run = arr.length - 2
  arr.each do |num|
      arr.each_with_index do |num2, index|
        if arr[index + 1].nil? == false
          if arr[index].length > arr[index + 1].length 
            temp = arr[index]
            arr[index] = arr[index + 1]
            arr[index + 1] = temp
          end
        end
      end
      run -= 1
  end
arr
end

test_block = ['hi', 'hello', 'hey']
test_arr = [4, 3, 78, 2, 0, 2]

complete = bubble_sort(test_arr)
block = bubble_sort_by(test_block)

print complete
print block
