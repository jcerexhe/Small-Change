class AddColToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :youtube, :boolean
  end
end
