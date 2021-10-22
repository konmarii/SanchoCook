class AddEvaluationToRecipeComment < ActiveRecord::Migration[5.2]
  def change
    add_column :recipe_comments, :evaluation, :float
  end
end
