class AddLinkClicksToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :link_clicks, :integer
  end
end
