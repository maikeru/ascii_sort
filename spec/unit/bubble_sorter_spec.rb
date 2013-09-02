require 'bubble_sorter'

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
end

class MockListener
  attr_reader :last_event
  def step input
    @last_event = input
  end
end

