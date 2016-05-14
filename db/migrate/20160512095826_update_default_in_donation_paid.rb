class UpdateDefaultInDonationPaid < ActiveRecord::Migration
  def up
    change_column_default :donations, :paid, false
  end

  def down
    change_column_default :donations, :paid, nil
  end
end
