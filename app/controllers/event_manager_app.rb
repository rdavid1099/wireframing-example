require 'models/event_manager'

class EventManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    redirect '/events'
  end

  get '/events' do
    @events = event_manager.all
    erb :index
  end

  get '/events/:id' do |id|
    @event = event_manager.find(id.to_i)
    erb :show
  end

  def event_manager
    database = YAML::Store.new('db/event_manager')
    @event_manager ||= EventManager.new(database)
  end
end
