require 'rails_helper'

RSpec.describe "CharityCategories", type: :request do
  describe "GET /charity_categories" do
    it "works! (now write some real specs)" do
      get charity_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
