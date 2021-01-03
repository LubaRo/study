test:
	docker-compose run --rm ruby bash -c 'bundle exec rake test'

lint:
	docker-compose run --rm ruby bash -c 'bundle exec rubocop'

lint-fix:
	docker-compose run --rm ruby bash -c 'bundle exec rubocop -a'

.PHONY: all test clean