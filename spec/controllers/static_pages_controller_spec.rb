require 'spec_helper'

describe StaticPagesController do
  let!(:submission)  { FactoryGirl.create(:submission) }

  describe "GET 'founders'" do
    it "returns successful request" do
      get :about_the_founders
      expect(response).to be_success
    end
  end

  describe "GET 'terms'" do
    it "returns successful request" do
      get :terms
      expect(response).to be_success
    end
  end

  describe "GET 'faq'" do
    it "returns successful request" do
      get :faq
      expect(response).to be_success
    end
  end

  describe "GET 'submissiontype'" do
    it "returns successful request" do
      get :choose_submission_type, submission: submission.id
      expect(response).to be_success
    end
  end

end
