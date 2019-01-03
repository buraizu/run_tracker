class RunGoal < ActiveRecord::Base
  belongs_to :run
  belongs_to :goal
end
