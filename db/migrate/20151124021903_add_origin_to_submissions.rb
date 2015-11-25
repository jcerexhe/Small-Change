class AddOriginToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :origin, :string
  end
end
