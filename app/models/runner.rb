class Runner < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :runs
  has_many :runner_events
  has_many :events, through: :runner_events

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:username => auth_hash[:info][:nickname]).first_or_create do |runner|
      runner.password = SecureRandom.hex
    end
  end

end


# def self.find_or_create_by_omniauth(auth_hash)
#   self.where(:name => auth_hash["info"]["name"]).first_or_create do |user|
#     user.password = SecureRandom.hex
#   end
# end

# validates :title, presence: true
# validates :title, uniqueness: {
#   scope: :release_year, message: "cannot have same title in same year"
# }
# validates :artist_name, presence: true
# validates :released, inclusion: { in: [true, false] }
# validate :release_year_legit
