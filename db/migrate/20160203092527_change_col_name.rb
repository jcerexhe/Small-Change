class ChangeColName < ActiveRecord::Migration
  def change
      rename_column :charities, :logo, :choose_charity_logo
  end
end
