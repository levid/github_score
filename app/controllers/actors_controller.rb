class ActorsController < ApplicationController
  def show
    username = URI.escape(params[:id])

    actor = Actor.find_by_login(username) || begin
      json = GithubLoader.new.events_for(URI.escape(username))

      if json.empty?
        render :nothing => true
        return
      end

      actor = json[0]["actor_attributes"]
      Actor.create_or_find_from_github(actor)
    end

    render :json => actor
  end
end
