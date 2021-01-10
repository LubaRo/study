module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for elem in self
          yield elem
        end
      end

      # Написать свою функцию my_map
      def my_map(&block)
        new_arr = self.class.new
        my_each { |elem| new_arr << block.call(elem) }
        new_arr
      end

      # Написать свою функцию my_compact
      def my_compact
        new_arr = self.class.new
        my_each { |elem| new_arr << elem if !elem.nil? }
        new_arr
      end

      # Написать свою функцию my_reduce
      def my_reduce; end
    end
  end
end
