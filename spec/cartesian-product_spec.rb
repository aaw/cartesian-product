require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "CartesianProduct" do
  it "behaves correctly when given an empty list" do
    CartesianProduct.new.to_a.should == [[]]
  end
  it "correctly computes the product of  single array" do
    CartesianProduct.new([1,2,3]).to_a.should == [[1],[2],[3]]
  end
  it "correctly computes the product of two arrays" do
    CartesianProduct.new([1,2,3],['a','b']).to_a.should == [1,2,3].product(['a','b'])
  end
  it "correctly computes the product of three arrays" do
    CartesianProduct.new([1,2], ['a','b','c'], [:d]).to_a.should == [[1,2], ['a','b','c'], [:d]].reduce(&:product).map(&:flatten)
  end
  it "handles an empty array mixed with non-empty arrays correctly" do
    CartesianProduct.new([1,2], ['a','b','c'], []).to_a.should == [[1,2], ['a','b','c'], []].reduce(&:product).map(&:flatten)
  end
  it "allows iteration over arbitrary ranges" do
    prod = CartesianProduct.new([1,2,3], [:four, :five, :size], ['seven', 'eight', 'nine'])
    collection = []
    prod.each(0, 2) { |x| collection << x }
    prod.each(2, 7) { |x| collection << x }
    prod.each(7, prod.count) { |x| collection << x }
    prod.to_a.should == collection
  end
  it "returns the count of elements in the product" do
    prod = CartesianProduct.new([1,2,3], [:four], ['five', 'six'])
    prod.count.should == [1,2,3].length * [:four].length * ['five','six'].length
  end
  it "allows indexing using negative numbers" do
    prod = CartesianProduct.new([1,2,3], [:four], ['five', 'six'])
    items = []
    prod.each(0,-1) { |x| items << x }
    prod.to_a.should == items

    items = []
    prod.each(0,-2) { |x| items << x }
    prod.to_a[0..-2].should == items

    items = []
    prod.each(-5, -3) { |x| items << x }
    prod.to_a[-5..-3].should == items
  end
  it "allows iterating over the same range multiple times" do
    prod = CartesianProduct.new((0..1000).to_a, (0..1000).to_a, (0..1000).to_a)
    items_1 = []
    prod.each(60, 67) { |x| items_1 << x }
    items_2 = []
    prod.each(60, 67) { |x| items_2 << x }
    items_1.should == items_2
  end
  it "iterates over the array without materializing it" do
    results = []
    CartesianProduct.new((0..1000).to_a, (0..1000).to_a, (0..1000).to_a).each(9000,9002) { |x| results << x }
    results.length.should == 2
    results.each{ |result| result.length.should == 3 }
  end
end
