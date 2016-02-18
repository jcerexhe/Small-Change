class AddSubmissionTypeToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :submission_type, :string
  end
end
