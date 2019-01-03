class Run< ActiveRecord::Base
  belongs_to :runner
  has_many :run_goals
  has_many :goals, through: :run_goals

  def self.long_distance
    scope :distance, -> { where(distance: 15) }
  end

end
