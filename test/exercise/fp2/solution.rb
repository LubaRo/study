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
        func = ->(acc, elem) { acc << block.call(elem) }
        my_reduce(self.class.new, &func)
      end

      # Написать свою функцию my_compact
      def my_compact
        func = lambda { |acc, elem|
          acc << elem unless elem.nil?
          acc
        }
        my_reduce(self.class.new, &func)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        if acc.nil?
          acc = first
          arr = self[1..-1]
        else
          arr = dup
        end
        arr.my_each { |elem| acc = block.call(acc, elem) }
        acc
      end
    end
  end
end
