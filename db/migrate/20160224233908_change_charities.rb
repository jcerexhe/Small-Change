class ChangeCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :choose_charity_logo, :string
    remove_column :charities, :banner_logo, :string
    remove_column :charities, :activity_one, :string
    remove_column :charities, :activity_two, :string
    remove_column :charities, :activity_three, :string

    add_column :charities, :logo, :string
    add_column :charities, :blurb, :text
  end
end
