require './main'

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5, 6] }
  describe ".my_each" do
    it "return the same array, but print the result according the block" do
      expect([1, 2, 3, 4].my_each { |element| print element + 1}).to eql([1, 2, 3, 4])
    end

    it "return the same array, but print only the values according the if statement" do
      expect([1, 2, 3, 4].my_each { |element| print element if element.even?}).to eql([1, 2, 3, 4])
    end
  end

  describe ".my_each_with_index" do
    it "return the same array, but print values according the requirements using an index for the elements" do
      expect(%w[apple banana strawberry pineapple].each_with_index { |fruit, index| print fruit if index.even? }).to eql(%w[apple banana strawberry pineapple])
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
  end
end

  