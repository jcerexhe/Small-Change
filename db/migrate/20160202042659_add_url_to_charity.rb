class AddUrlToCharity < ActiveRecord::Migration
  def change
    add_column :charities, :url, :string
  end
end
