require_dependency "github_loader"

class Actor < ActiveRecord::Base
  attr_accessible :blog, :company, :email, :gravatar_id, :location, :login, :name, :actor_type

  def self.create_or_find_from_github(actor_json)
    if actor = find_by_login(actor_json["login"])
      return actor
    end

    hash                = actor_json.slice(*%w(blog company email gravatar_id location login name))
    hash["actor_type"]  = actor_json["type"]
    create(hash)
  end
end
