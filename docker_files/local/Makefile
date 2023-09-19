.PHONY: install, test, lint, format, console, seed, bash, create, migrate, rollback

install:
	bundle install

test:
	bundle exec rspec

lint:
	bundle exec rubocop

format:
	bundle exec rubocop -A

console:
	bundle exec rails c

seed:
	bundle exec rails db:seed

bash:
	echo "make: *** No rule to make target 'bash' at Local.  Stop."

create:
	docker-compose exec app bundle exec rails db:create

migrate:
	bundle exec rails db:migrate

rollback:
	bundle exec rails db:rollback
