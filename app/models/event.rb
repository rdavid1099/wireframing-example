class Event
  attr_reader :title,
              :description,
              :host,
              :location,
              :id

  def initialize(data)
    @id          = data["id"]
    @title       = data["title"]
    @description = data["description"]
    @host        = data["host"]
    @location    = data["location"]
  end
end
