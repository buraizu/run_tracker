class Runner < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true

  has_many :runs
  has_many :runner_goals
  has_many :goals, through: :runner_goals

end

# def goals_attributes=(goals_hashes)         # Not sure about any of this
#   goals_hashes.each do |i, goal_attributes|
#     if goal_attributes[:description].present?
#       goal = Goal.find_or_create_by(description: goal_attributes[:description])
#       self.goals << goal
#     end
#   end
# end


# validates :title, presence: true
# validates :title, uniqueness: {
#   scope: :release_year, message: "cannot have same title in same year"
# }
# validates :artist_name, presence: true
# validates :released, inclusion: { in: [true, false] }
# validate :release_year_legit
