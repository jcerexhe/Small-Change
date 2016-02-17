class AddPetitionLinkToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :petition_link, :string
  end
end
