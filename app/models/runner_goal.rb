class RunnerGoal < ActiveRecord::Base
  belongs_to :runner
  belongs_to :goal
end
