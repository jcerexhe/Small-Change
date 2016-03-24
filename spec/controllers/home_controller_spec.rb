require 'spec_helper'

describe HomeController do

  describe "GET 'show'" do
    it "returns successful request" do
      get :index
      expect(response).to be_success
    end

    it "assigns a new Submission to @contact" do
      get :index
      expect(assigns(:submission)).to be_a_new(Submission)
    end
  end

end
