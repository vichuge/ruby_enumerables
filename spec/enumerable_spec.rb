require './main'

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5, 6] }
  describe '.my_each' do
    it 'return the same array, but print the result according the block' do
      expect([1, 2, 3, 4].my_each { |element| print element + 1 }).to eql([1, 2, 3, 4])
    end

    it 'return the same array, but print only the values according the if statement' do
      expect([1, 2, 3, 4].my_each { |element| print element if element.even? }).to eql([1, 2, 3, 4])
    end
  end

  describe '.my_each_with_index' do
    it 'return the same array, but print values according the requirements using an index for the elements' do
      expect(%w[apple banana strawberry pineapple].each_with_index do |fruit, index|
               print fruit if index.even?
             end).to eql(%w[apple banana
                            strawberry pineapple])
    end
  end

  describe '.my_select' do
    it 'returns an array with the items that match yield pattern' do
      expect(array.my_select(&:even?)).to eql([2, 4, 6])
    end
  end

  describe '.my_all?' do
    it 'unless block_given, returns true if all items are true' do
      expect(array.my_all?).to eql(true)
    end

    it "doesn't return true if an item is false or nil" do
      expect([nil, true, 99].my_all?).to eql(false)
    end

    it "returns false if the item doesn't have the value contrasted" do
      expect(%w[dance girl gasoline].my_all?(/x/)).to eql(false)
    end
  end

  describe '.my_any?' do
    it 'returns true if one of the items exceed in length the value given' do
      expect(%w[ant bear cat].my_any? { |word| word.length >= 4 }).to eql(true)
    end

    it 'returns true if any of the items is an integer' do
      expect([nil, true, 99].my_any?(Integer)).to eql(true)
    end

    it "returns false if there's an empty array" do
      expect([].my_any?).to eql(false)
    end
  end

  describe '.my_none?' do
    it "return if all the items doesn't have a length of 5 letters" do
      expect(%w[ant bear cat].my_none? { |word| word.length == 5 }).to eql(true)
    end

    it "return false if all elements aren't float" do
      expect([1, 3.14, 42].my_none?(Float)).to eql(false)
    end

    it 'return false if any of the elements are true' do
      expect([nil, false, true].my_none?).to eql(false)
    end
  end

  describe '.my_count' do
    it 'Count the numbers of the element' do
      expect([1, 2, 4, 2].my_count).to eql(4)
    end

    it 'Count the numbers of the element multiple of two' do
      expect([1, 2, 4, 2].my_count(&:even?)).to eql(3)
    end
  end

  describe '.my_map' do
    it 'return the array with changes according the block' do
      expect(%w[a b c].my_map(&:upcase)).to eql(%w[A B C])
    end

    it 'return the array adding 1 to each element' do
      expect(array.my_map { |element| element + 1 }).to eql([2, 3, 4, 5, 6, 7])
    end
  end

  describe '.my_inject' do
    it 'return the multiplication of all numbers inside the array starting with four' do
      expect((5..10).my_inject(4) { |prod, n| prod * n }).to eql(604_800)
    end

    it 'return the multiplication of all numbers inside the array starting with two' do
      expect((5..10).my_inject(2, :*)).to eql(302_400)
    end

    it 'return the add to all the elements in the array' do
      expect(array.my_inject { |accum, elem| accum + elem }).to eql(21)
    end
  end
end
