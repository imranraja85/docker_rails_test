# Make sure old containers are gone
docker-compose -f test.yml -p docker_rails_test stop
docker-compose -f test.yml -p docker_rails_test rm --force --all -v

# Build the GEAR controller image
docker-compose -f test.yml -p docker_rails_test build

# Run RSpec tests
docker-compose -f test.yml -p docker_rails_test run --rm app rspec
ERR=$?

# Stop and remove GEAR Controller containers
docker-compose -f test.yml -p docker_rails_test stop
docker-compose -f test.yml -p docker_rails_test rm --force --all -v

if [ $ERR -eq 0 ]; then
  docker push imranraja85/railsapp
fi
