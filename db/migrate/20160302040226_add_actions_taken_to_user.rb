class AddActionsTakenToUser < ActiveRecord::Migration
  def change
    add_column :users, :actions_taken, :integer, default: 0
  end
end
