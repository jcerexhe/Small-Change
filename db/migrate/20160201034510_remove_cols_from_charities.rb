class RemoveColsFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :abn
    remove_column :charities, :address
    remove_column :charities, :youtube_link
  end
end
