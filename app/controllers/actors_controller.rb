class ActorsController < ApplicationController
  def index
    actor = by_username(params[:username] || params[:login])

    unless actor
      render :json => [].to_json
      return
    end

    render :json => [actor]
  end

  def show
    render :json => by_username(params[:id])
  end

private
  def by_username(username)

    actor = Actor.find_by_login(username) || begin
      json = GithubLoader.new.events_for(URI.escape(username))

      if json.empty?
        render :nothing => true
        return nil
      end

      actor = json[0]["actor_attributes"]
      Actor.create_or_find_from_github(actor)
    end

    actor
  end
end
