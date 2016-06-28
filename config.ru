require "bundler"

Bundler.require

$LOAD_PATH.unshift(File.expand_path("app", __dir__))

require 'controllers/event_manager_app'

run EventManagerApp
