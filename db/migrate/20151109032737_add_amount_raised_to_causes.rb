class AddAmountRaisedToCauses < ActiveRecord::Migration
  def change
  	    add_column :causes, :amount_raised, :decimal

  end
end
