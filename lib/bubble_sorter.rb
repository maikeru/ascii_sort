class BubbleSorter
  def initialize(listener, input)
    @listener = listener
    @working_list = input
    @unsorted_max_index = input.length - 2
  end

  def sort
    while @unsorted_max_index >= 0 do
      for index in (0 .. @unsorted_max_index)
        left = @working_list[index]
        right = @working_list[index + 1]
        if (left > right)
          @working_list[index] = right
          @working_list[index + 1] = left
        end
        @listener.step(@working_list)
      end
      @unsorted_max_index -= 1
    end
    @working_list
  end

end
