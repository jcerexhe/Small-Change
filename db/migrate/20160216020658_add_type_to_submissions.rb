class AddTypeToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :type, :string
  end
end
