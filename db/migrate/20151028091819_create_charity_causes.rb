class CreateCharityCauses < ActiveRecord::Migration
  def change
    create_table :charity_causes do |t|
      t.references :cause, index: true, foreign_key: true
      t.references :charity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
