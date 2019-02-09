class RunnerEventSerializer < ActiveModel::Serializer
  attributes :id, :finish_time
  belongs_to :runner
  belongs_to :event
end
