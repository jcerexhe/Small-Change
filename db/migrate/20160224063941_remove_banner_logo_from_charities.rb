class RemoveBannerLogoFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :banner_logo, :string
  end
end
