require "rails_helper"

RSpec.describe CharityCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/charity_categories").to route_to("charity_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/charity_categories/new").to route_to("charity_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/charity_categories/1").to route_to("charity_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/charity_categories/1/edit").to route_to("charity_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/charity_categories").to route_to("charity_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/charity_categories/1").to route_to("charity_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/charity_categories/1").to route_to("charity_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/charity_categories/1").to route_to("charity_categories#destroy", :id => "1")
    end

  end
end
