class RemoveCharityFromSubmission < ActiveRecord::Migration
  def change
    remove_column :submissions, :charity, :integer
  end
end
