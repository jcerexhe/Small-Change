class CreateUserSubmissions < ActiveRecord::Migration
  def change
    create_table :user_submissions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :submission, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
