class AddCharityLinkToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :charity_link, :string
  end
end
