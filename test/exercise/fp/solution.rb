module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        sum, count = films.map { |film| { countries_count: count_countries(film['country']), rating: film['rating_kinopoisk'].to_f } }
                          .select { |elem|  elem[:rating].positive? && elem[:countries_count] >= 2 }
                          .reduce([0, 0]) { |acc, elem| [acc[0] + elem[:rating], acc[1] + 1] }
        return 0 if count.zero?

        sum / count
      end

      def count_countries(country_row)
        country_row.is_a?(String) ? country_row.strip.split(',').length : 0
      end

      def chars_count(films, threshold)
        search_char = 'и'
        films.map { |film| { name: film['name'], rating: film['rating_kinopoisk'].to_f } }
             .map { |film| film[:rating] >= threshold ? film[:name].count(search_char) : 0 }
             .reduce(&:+)
      end
    end
  end
end
