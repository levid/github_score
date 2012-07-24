require_dependency "github_loader"

class Event < ActiveRecord::Base
  belongs_to :actor
  attr_accessible :payload, :public, :repository, :event_type, :url

  def self.create_from_stream(username, events)
    return if events.empty?

    Event.where(:username => username).delete_all

    actor_json  = events[0]["actor_attributes"]
    actor       = Actor.create_or_find_from_github(actor_json)

    events.map do |event|
      create_from_hash(event, actor)
    end
  end

  def self.create_from_hash(event_json, actor)
    hash              = event_json.slice(*%w(username public repository url))
    event             = new(hash)
    event.payload     = event_json["payload"].to_json
    event.event_type  = event_json["type"]
    event.actor       = actor
    event.save
    event
  end
end
