#!/usr/bin/env bash
# exit on error
set -o errexit #This sets the script to exit immediately if any command returns a non-zero exit status, indicating an error.

bundle install
bundle exec rake assets:precompile #This compiles your application's assets, such as JavaScript and CSS, and prepares them for production use.
bundle exec rake assets:clean # This command removes any temporary files generated during the asset precompilation process.
bundle exec rake db:migrate