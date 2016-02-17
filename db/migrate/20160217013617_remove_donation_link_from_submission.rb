class RemoveDonationLinkFromSubmission < ActiveRecord::Migration
  def change
    remove_column :submissions, :donation_link, :string
  end
end
