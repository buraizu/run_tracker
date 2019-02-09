class EventSerializer < ActiveModel::Serializer
  attributes :id, :description
  has_many :runner_events
  has_many :runners, through: :runner_events
end
