class TidyDatabase < ActiveRecord::Migration
  def change
    drop_table :user_submissions
    drop_table :profiles
    drop_table :enquiries
    drop_table :charity_causes
    drop_table :causes
    drop_table :beta_users

    remove_column :charities, :cause_id, :integer
    add_reference :submissions, :charity, index: true, foreign_key: true
    add_reference :submissions, :submission, index: true, foreign_key: true 
  end
end
