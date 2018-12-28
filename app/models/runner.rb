class Runner < ActiveRecord::Base
  has_many :runs
  has_many :goals, through: :runs
  has_many :followups, through: :runs
end
