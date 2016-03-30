class CreateCharityCategories < ActiveRecord::Migration
  def change
    create_table :charity_categories do |t|
      t.references :charity, index: true, foreign_key: true
      t.string :category_name

      t.timestamps null: false
    end
  end
end
