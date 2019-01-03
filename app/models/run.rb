class Run< ActiveRecord::Base
  belongs_to :runner

  def self.long_distance
    scope :distance, -> { where(distance: 15) }
  end

end
