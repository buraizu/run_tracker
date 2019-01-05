class Run< ActiveRecord::Base
  belongs_to :runner

  scope :longest, -> { order(distance: :desc).limit(1) }

  validates :course, presence: true
  validates :distance, presence: true
  validates :distance, numericality: true
  validates :time, presence: true
  validates :time, numericality: {only_integer: true}
  validates :rating, presence: true
  validates :rating, numericality: {only_integer: true}
  validates :review, presence: true

end
