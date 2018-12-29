class Goal < ActiveRecord::Base
  has_many :runs
  accepts_nested_attributes_for :runners
  def new
    raise params.inspect
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
