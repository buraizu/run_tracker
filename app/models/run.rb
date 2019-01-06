class Run< ActiveRecord::Base
  belongs_to :runner

  def self.longest
    self.order(distance: :desc).first
  end

  validates :course, presence: true
  validates :distance, presence: true
  validates :distance, numericality: true
  validates :time, presence: true
  validates :time, numericality: {only_integer: true}
  validates :rating, presence: true
  validates :rating, numericality: {only_integer: true}
  validates :review, presence: true

end
