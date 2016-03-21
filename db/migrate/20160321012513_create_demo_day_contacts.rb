class CreateDemoDayContacts < ActiveRecord::Migration
  def change
    create_table :demo_day_contacts do |t|
      t.string :email
      t.text :message

      t.timestamps null: false
    end
  end
end
