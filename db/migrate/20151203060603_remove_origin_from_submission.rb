class RemoveOriginFromSubmission < ActiveRecord::Migration
  def change
    remove_column :submissions, :origin, :string
  end
end
