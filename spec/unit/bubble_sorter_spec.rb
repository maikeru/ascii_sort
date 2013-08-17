require 'bubble_sorter'

# Sorter needs
  # Starting list
  # Current result
#
  # Should the sorter return a value after each step (in which case we need to keep calling it to step)
  # Or should it call out to a listener after each step?
# Asciifier needs
  # list of items at current sorting step

describe BubbleSorter, "#sort" do
  context "with a sorted list" do
    input = (1 .. 10).to_a
    it "calls the listener after the first step" do
      listener = double("listener")
      expect(listener).to receive(:step).with(input)
      sorter = BubbleSorter.new(listener, input)
      sorter.sort
    end

    it "finishes after one pass (nine steps)" do
    end
  end

  context "reverse-sorted list" do
  end

  context "un-sorted list" do
  end
end

