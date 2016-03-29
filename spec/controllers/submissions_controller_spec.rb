require 'spec_helper'

describe SubmissionsController do
  let!(:submission)  { create(:submission) }
  let(:charity)      { create(:charity) }

  describe "GET #show" do
    it "returns successful request" do
      get :show, id: submission.id
      expect(response).to be_success
    end

    it "assigns @submission" do
      get :show, id: submission
      expect(assigns(:submission)).to eq submission
    end
  end

  describe "GET #index" do
    subject { get :index }

    it "returns successful request" do
      subject
      expect(response).to be_success
    end

    it "assigns @submissions" do
      subject
      expect(assigns[:submissions]).to eq [submission]
    end

    xit "assigns @most_recent" do
      subject
      expect(assigns[:most_recent]).to eq [submission]
    end
  end

  describe "GET #edit" do
    subject { get :edit, id: submission.id }

    it "returns successful request" do
      subject
      expect(response).to be_success
    end

    it "assigns @charities" do
      subject
      expect(assigns[:charities]).to eq [charity]
    end

    it "assigns @submission" do
      get :show, id: submission
      expect(assigns(:submission)).to eq submission
    end
  end

  describe "GET #counter" do
    xit "should increment link clicks" do
      expect(get :counter, id: submission).to change(submission.link_clicks, :count).by(1)
    end
  end

  describe "DELETE #destroy" do
    subject { delete :destroy, id: submission.id }

    it "deletes the submission" do
      expect{ subject }.to change(Submission, :count).by(-1)
    end

    it "redirects to contacts#index" do
      subject
      expect(response).to redirect_to admin_index_path
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      subject { post :create, :submission => attributes_for(:submission) }

      xit 'saves the new submission in the database' do
        expect { subject }.to change(Submission, :count).by(1)
      end

      xit 'redirects to submission type' do
        subject
        expect(response).to redirect_to(submissiontype_path(Submission.last))
      end
    end

    context 'with invalid attributes' do
      subject { post :create, :submission => { :foo => 'bar' } }

      it 'does not save a new submission in the database' do
        expect { subject }.to_not change(Submission, :count)
      end

      xit 'redirects to :back' do
        subject
        expect(response).to redirect_to :back
      end
    end
  end

end
