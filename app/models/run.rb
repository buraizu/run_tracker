class Run< ActiveRecord::Base
  belongs_to :runner

  validates :course, presence: true
  validates :distance, numericality: true
  validates :time, numericality: {only_integer: true}
  validates :rating, numericality: {only_integer: true}
  validates :review, presence: true


  def self.long_distance
    scope :distance, -> { where(distance: 15) }
  end

end
