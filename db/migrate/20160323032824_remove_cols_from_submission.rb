class RemoveColsFromSubmission < ActiveRecord::Migration
  def change
    remove_column :submissions, :charity_link, :string
    # remove_column :submissions, :charity_id, :integer
    remove_reference :submissions, :charity
  end
end
