class Runner < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true

  has_many :runs
  has_many :goals, through: :runs

end


# validates :title, presence: true
# validates :title, uniqueness: {
#   scope: :release_year, message: "cannot have same title in same year"
# }
# validates :artist_name, presence: true
# validates :released, inclusion: { in: [true, false] }
# validate :release_year_legit
