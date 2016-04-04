class AddDescriptionToCharityCategories < ActiveRecord::Migration
  def change
    add_column :charity_categories, :description, :text
  end
end
