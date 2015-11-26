class AddCauseToCharity < ActiveRecord::Migration
  def change
    add_reference :charities, :cause, index: true, foreign_key: true
  end
end
