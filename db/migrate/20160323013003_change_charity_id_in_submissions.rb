class ChangeCharityIdInSubmissions < ActiveRecord::Migration
  def change
    remove_reference :submissions, :charity_id
    remove_column :submissions, :youtube
    add_reference :submissions, :charity_category, index: true
  end
end
