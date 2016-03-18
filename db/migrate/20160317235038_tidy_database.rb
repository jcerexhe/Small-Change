class TidyDatabase < ActiveRecord::Migration
  def change
    # drop_table :user_submissions, force: :cascade
    # drop_table :profiles, force: :cascade
    # drop_table :enquiries, force: :cascade
    # drop_table :charity_causes, force: :cascade
    # drop_table :causes, force: :cascade
    # drop_table :beta_users, force: :cascade

    remove_column :charities, :cause_id, :integer
    add_reference :submissions, :charity, index: true, foreign_key: true
    add_reference :submissions, :submission, index: true, foreign_key: true
  end
end
