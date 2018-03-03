module Libertree
  class AndedList
    def initialize(array)
      @array = array or raise(ArgumentError)
    end

    def to_s
      case @array.length
      when 0
        ""
      when 1
        @array[0]
      else @array.length > 1
        @array[0...-1].join(', ') + " and " + @array[-1]
      end
    end
  end
end
