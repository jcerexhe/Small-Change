require 'spec_helper'

describe SubmissionsController do
  let!(:submission)  { create(:submission) }

  describe "GET 'show'" do
    it "returns successful request" do
      get :show, id: submission.id
      expect(response).to be_success
    end

    it "assigns @submission" do
      get :show, id: submission.slug
      expect(assigns[:submission]).to eq [submission]
    end
  end

  describe "GET 'index'" do
    it "returns successful request" do
      get :index
      expect(response).to be_success
    end

    it "assigns @submissions" do
      get :index
      expect(assigns[:submissions]).to eq [submission]
    end
  end

  # describe "GET 'faq'" do
  #   it "returns successful request" do
  #     get :faq
  #     expect(response).to be_success
  #   end
  # end

  # describe "GET 'submissiontype'" do
  #   it "returns successful request" do
  #     get :choose_submission_type, submission: submission.id
  #     expect(response).to be_success
  #   end
  # end

end
