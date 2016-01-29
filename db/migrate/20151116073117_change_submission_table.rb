class ChangeSubmissionTable < ActiveRecord::Migration
  def change
  	remove_column :submissions, :user_id, :integer
  	remove_column :submissions, :charity_id, :integer
  	remove_column :submissions, :cause_id, :integer

  	add_column :submissions, :title, :string
  	add_column :submissions, :favicon, :string
  	add_column :submissions, :description, :text
  	add_column :submissions, :image, :string



  end
end
