class RemoveTypeFromSubmission < ActiveRecord::Migration
  def change
    remove_column :submissions, :type, :string
  end
end
