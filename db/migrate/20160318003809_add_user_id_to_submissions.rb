class AddUserIdToSubmissions < ActiveRecord::Migration
  def change
    add_reference :submissions, :user, index: true, foreign_key: true
    remove_column :submissions, :submission_id, :integer
  end
end
