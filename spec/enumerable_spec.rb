require './main'

describe Enumerable do
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
end