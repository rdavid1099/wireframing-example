require 'yaml/store'
require_relative 'event'

class EventManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(event)
    database.transaction do
      database['events'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['events'] << { "id" => database['total'], "title" => event[:title], "description" => event[:description], "host" => event[:host], "location" => event[:location] }
    end
  end

  def raw_events
    database.transaction do
      database['events'] || []
    end
  end

  def all
    raw_events.map { |data| Event.new(data) }
  end

  def raw_event(id)
    raw_events.find { |event| event["id"] == id }
  end

  def find(id)
    Event.new(raw_event(id))
  end
end
