require 'spec_helper'

describe DashboardController do
  context 'signed in user' do
    let!(:user)           { create(:user, actions_taken: 10) }
    before                { sign_in user }
    let!(:submission)     { create(:submission, user_id: user.id, link_clicks: 100) }

    describe "GET 'show'" do
      subject { get :show }

      it "returns successful request" do
        subject
        expect(response).to be_success
      end

      it "assigns @submissions" do
        subject
        expect(assigns[:submissions]).to eq [submission]
      end

      it "assigns a new Submission to @submission" do
        subject
        expect(assigns(:submission)).to be_a_new(Submission)
      end

      it "assigns @submission_count" do
        subject
        expect(assigns[:submission_count]).to eq user.submissions.count
      end

      it "assigns @link_clicks" do
        subject
        expect(assigns[:link_clicks]).to eq user.submissions.sum(:link_clicks).to_i
      end

      it "assigns @donation_total" do
        subject
        expect(assigns[:donation_total]).to eq user.donations.sum(:amount).to_i
      end
    end
  end

  context 'signed out user' do
    let!(:submission)      { create(:submission) }

    it 'responds with redirect' do
      get :show
      expect(response).to redirect_to new_user_session_path
    end
  end
end
