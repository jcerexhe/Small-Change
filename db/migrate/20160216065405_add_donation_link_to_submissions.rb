class AddDonationLinkToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :donation_link, :string
  end
end
