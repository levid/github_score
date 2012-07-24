class ActorSerializer < ActiveModel::Serializer
  attributes :id, :blog, :company, :email, :gravatar_id, :location, :login, :name, :actor_type
end
