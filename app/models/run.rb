class Run< ActiveRecord::Base
  belongs_to :runner
  belongs_to :goal
  belongs_to :followup
end
