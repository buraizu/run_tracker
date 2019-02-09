class RunnerEvent < ActiveRecord::Base
  belongs_to :runner
  belongs_to :event

  validates :runner_id, presence: true
  validates :runner_id, numericality: {only_integer: true}
  validates :event_id, presence: true
  validates :event_id, numericality: {only_integer: true}

  def self.quickest
    self.order(finish_time: :asc).first
  end

  scope :accomplished, -> { where(completed: true) }

end
