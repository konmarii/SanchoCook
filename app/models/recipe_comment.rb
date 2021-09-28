class RecipeComment < ApplicationRecord
    belongs_to :customer
    belongs_to :recipe
    
    validates :evaluation, presence: true
    validates :comment, presence: true
end
