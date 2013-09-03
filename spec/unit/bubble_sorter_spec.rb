require 'bubble_sorter'
require 'ostruct'

describe BubbleSorter, "#sort" do
  let(:listener) { MockListener.new }
  context "with a sorted list" do
    presorted_list = (1 .. 10).to_a
    it "sorts a pre-sorted list" do
      sorter = BubbleSorter.new(listener, presorted_list)
      sorter.sort.should eq (1..10).to_a
    end
  end

  context "reverse-sorted list" do
    reverse_list = (1 .. 10).to_a.reverse
    it "sorts a reverse-sorted list" do
      sorter = BubbleSorter.new(listener, reverse_list)
      sorter.sort.should eq (1 .. 10).to_a
    end
  end

  context "un-sorted list" do
    random_list = [7, 4, 1, 2, 10, 7, 8, 10, 1, 4 ]
    it "sorts a random list" do
      sorter = BubbleSorter.new(listener, random_list)
      sorter.sort.should eq [1, 1, 2, 4, 4, 7, 7, 8, 10, 10]
    end
  end

  context "with a listener that records each step" do
    short_list = [3, 2, 1]
    it "calls the listener for each sorting step" do
      sorter = BubbleSorter.new(listener, short_list)
      sorter.sort
      listener.steps.should eq [[2, 3, 1], [2, 1, 3], [1, 2, 3]]
    end
  end
end

class MockListener
  attr_reader :steps
  def initialize
    @steps = []
  end

  def step input
    # Use Array.new so we get copy of the values in the array. Otherwise @steps will 
    # end up with multiple copies of the final sorted array
    @steps << Array.new(input)
  end
end

