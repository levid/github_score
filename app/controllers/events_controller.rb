class EventsController < ApplicationController
  def index
    username = params[:username]

    json    = GithubLoader.new.events_for(URI.escape(username))
    events  = Event.create_from_stream(username, json)
    render :json => events
  end
end
