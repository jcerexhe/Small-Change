require 'spec_helper'

describe AdminController do
  let(:submission)  { create(:submission) }
  let(:donation)    { create(:donation) }
  let(:charity)     { create(:charity) }

  context "signed in admin user" do
    let(:user)      { create(:user, admin: true) }
    before          { sign_in user }

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to be_success
      end

      it 'assigns @submissions' do
        get :index
        expect(assigns[:submissions]).to eq [submission]
      end

      it 'assigns @users' do
        get :index
        expect(assigns[:users]).to eq [user]
      end

      it 'assigns @donations' do
        get :index
        expect(assigns[:donations]).to eq [donation]
      end

      it 'assigns @charities' do
        get :index
        expect(assigns[:charities]).to eq [charity]
      end
    end
  end

end
