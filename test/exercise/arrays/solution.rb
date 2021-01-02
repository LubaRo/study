module Exercise
  module Arrays
    class << self
      def replace(array)
        replacement = array.max
        array.map { |num| num.positive? ? replacement : num }
      end

      def search(haystack, needle)
        not_found = -1

        return not_found if haystack.empty?

        binary_search = lambda { |start_key, end_key|
          return not_found if end_key < start_key

          if start_key == end_key
            result = haystack[start_key] == needle ? start_key : not_found
            return result
          end

          middle_key = (start_key + end_key) / 2

          return middle_key if haystack[middle_key] == needle

          if haystack[middle_key] > needle
            binary_search.call(start_key, middle_key - 1)
          else
            binary_search.call(middle_key + 1, end_key)
          end
        }
        binary_search.call(0, haystack.length - 1)
      end
    end
  end
end
