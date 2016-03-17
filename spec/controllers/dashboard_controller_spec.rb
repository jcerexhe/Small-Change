require 'spec_helper'

describe DashboardController do
  context 'signed in user' do
    let(:user)            { create(:user) }
    before                { sign_in user }
    let(:submission)      { create(:submission) }
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

# @submissions = current_user.submissions
# @submissions_actions = @submissions.sum(:link_clicks)
# @user_actions = current_user.actions_taken
# @submission = Submission.new

# @users = User.all
# @total_actions_taken = @users.sum(:actions_taken)
