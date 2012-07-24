class EventsController < ApplicationController
  def show
    username = params[:id]

    json    = GithubLoader.new.events_for(URI.escape(username))
    events  = Event.create_from_stream(username, json)
    render :json => events
  end
end
