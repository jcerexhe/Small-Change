class ChangeLinkClicksInSubmissions < ActiveRecord::Migration
  def change
    change_column :submissions, :link_clicks, :integer, default: 0
  end
end
