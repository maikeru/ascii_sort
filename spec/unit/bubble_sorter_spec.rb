require 'bubble_sorter'

describe BubbleSorter, "#sort" do
  context "with a sorted list" do
    input = (1 .. 10).to_a
    it "calls the listener after the first step" do
      listener = MockListener.new
      sorter = BubbleSorter.new(listener, input)
      sorter.sort
      listener.last_event.should eq (1 .. 10).to_a
    end
  end

  context "reverse-sorted list" do
    reverse_list = (1 .. 10).to_a.reverse
    it "calls the listener with the sorted list" do
      result_list = ()
      listener = MockListener.new
      sorter = BubbleSorter.new(listener, reverse_list)
      sorter.sort.should eq (1 .. 10).to_a
      #listener.last_event.should eq (1 .. 10).to_a
    end
  end

  context "un-sorted list" do
  end
end

class MockListener
  attr_reader :last_event
  def step input
    @last_event = input
  end
end

