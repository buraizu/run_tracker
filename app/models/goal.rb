class Goal < ActiveRecord::Base
  has_many :run_goals
  has_many :runs, through: :run_goals

  def new
    raise params.inspect
  end

  def self.accomplished
    scope :completed, -> { where(completed: true) }
  end

end


# class Recipe < ActiveRecord::Base
#   has_many :ingredients
#   accepts_nested_attributes_for :ingredients
#
#   def ingredients_attributes=(ingredients_attributes)
#     ingredients_attributes.each do |i, ingredient_attributes|
#       self.ingredients.build(ingredient_attributes)
#     end
#   end
#
# end
