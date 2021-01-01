module Exercise
  module Arrays
    class << self
      def replace(array)
        replacement = array.max
        array.map { |num| num.positive? ? replacement : num }
      end

      def search(_array, _query)
        0
      end
    end
  end
end
