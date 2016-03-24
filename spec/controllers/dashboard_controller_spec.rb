require 'spec_helper'

describe DashboardController do
  context 'signed in user' do
    let(:user)            { create(:user, actions_taken: 10) }
    before                { sign_in user }
    let(:submission)      { create(:submission, user_id: user.id, link_clicks: 100) }
    let(:user_submission) { create(:user_submission, user_id: user.id, submission_id: submission.id) }


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

      xit "assigns @submissions_actions" do
        subject
        expect(assigns[:submissions_actions]).to eq submission.link_clicks
      end

      it "assigns @user_actions" do
        subject
        expect(assigns[:user_actions]).to eq user.actions_taken
      end

      it "assigns @users" do
        subject
        expect(assigns[:users]).to eq [user]
      end

      it "assigns a new Submission to @contact" do
        get :index
        expect(assigns(:submission)).to be_a_new(Submission)
      end
    end
  end

  context 'signed out user' do
    subject { get :show }

    it 'responds with redirect' do
      subject
      expect(response).to redirect_to new_user_session_path
    end
  end
end

# @submission = Submission.new
# @total_actions_taken = @users.sum(:actions_taken)
