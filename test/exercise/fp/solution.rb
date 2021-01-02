module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        result = films
                 .map { |film| { countries_count: count_countries(film['country']), rating: film['rating_kinopoisk'].to_f } }
                 .select { |film| film[:countries_count] >= 2 && film[:rating].positive? }
                 .each_with_object({ rating_sum: 0, count: 0 }) do |film, acc|
          acc[:rating_sum] += film[:rating]
          acc[:count] += 1
        end
        result[:rating_sum] / result[:count]
      end

      def count_countries(country_row)
        country_row.is_a?(String) ? country_row.strip.split(',').length : 0
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
