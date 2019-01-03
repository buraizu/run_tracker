class RunnerEvent < ActiveRecord::Base
  belongs_to :runner
  belongs_to :event
end
