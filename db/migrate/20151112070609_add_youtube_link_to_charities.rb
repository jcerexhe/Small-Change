class AddYoutubeLinkToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :youtube_link, :string
  end
end
