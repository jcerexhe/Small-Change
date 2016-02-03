class AddBannerLogoToCharity < ActiveRecord::Migration
  def change
    add_column :charities, :banner_logo, :string
  end
end
