require 'spec_helper'

describe HomeController do

  describe "GET 'show'" do
    it "returns successful request" do
      get :index
      expect(response).to be_success
    end
  end

end
