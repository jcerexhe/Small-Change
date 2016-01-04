class AddCharityToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :charity, :integer
  end
end
