class BubbleSorter
  def initialize(listener, input)
    @listener = listener
    @input = input
  end

  def sort
    @listener.step(@input)
  end
end
