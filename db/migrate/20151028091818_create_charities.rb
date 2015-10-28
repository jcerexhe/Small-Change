class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
      t.string :logo
      t.string :bsb
      t.string :account_number
      t.string :contact_name
      t.string :contact_email
      t.string :abn
      t.string :address

      t.timestamps null: false
    end
  end
end
