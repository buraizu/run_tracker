class Event < ActiveRecord::Base
  has_many :runner_events
  has_many :runners, through: :runner_events

  validates :description, presence: true

  def new
  
  end

  def self.accomplished
    scope :completed, -> { where(completed: true) }
  end


end
