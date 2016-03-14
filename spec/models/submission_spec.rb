require 'spec_helper'

describe Submission do

  let!(:submission1)   { create(:submission, link_clicks: 1) }
  let!(:submission2)   { create(:submission, link_clicks: 2) }

  describe 'scope :link_clicks_desc' do
    it 'should order Submissions in desc order of link clicks' do
      Submission.link_clicks_desc.should eq [submission2, submission1]
    end
  end

  # describe '#reviewed_by?' do
  #   it 'returns true if a submission has been reviewed by the provided user' do
  #     expect(submission1.reviewed_by?(user1)).to eq true
  #   end

  #   it 'returns false if a submission has not been reviewed by the provided user' do
  #     expect(submission2.reviewed_by?(user1)).to eq false
  #   end
  # end

  # describe '#average_rating' do
  #   it "returns the average rating from all that submission's reviews" do
  #     expect(submission1.average_rating).to eq 3.0
  #   end
  # end
end
