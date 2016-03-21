require 'spec_helper'

describe Submission do

  let!(:submission1)   { create(:submission, link_clicks: 1) }
  let!(:submission2)   { create(:submission, link_clicks: 2) }

  describe 'scope :link_clicks_desc' do
    it 'should order Submissions in desc order of link clicks' do
      Submission.link_clicks_desc.should eq [submission2, submission1]
    end
  end

end
