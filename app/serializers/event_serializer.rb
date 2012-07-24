class EventSerializer < ActiveModel::Serializer
  attributes :id, :payload, :public, :repository, :event_type, :url
  has_one :actor
end
