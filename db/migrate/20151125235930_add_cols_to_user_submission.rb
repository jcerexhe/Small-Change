class AddColsToUserSubmission < ActiveRecord::Migration
  def change
    add_reference :user_submissions, :donation, index: true, foreign_key: true
    add_reference :user_submissions, :charity, index: true, foreign_key: true
    add_reference :user_submissions, :cause, index: true, foreign_key: true
  end
end
