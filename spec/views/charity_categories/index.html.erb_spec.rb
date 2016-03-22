require 'rails_helper'

RSpec.describe "charity_categories/index", type: :view do
  before(:each) do
    assign(:charity_categories, [
      CharityCategory.create!(
        :charity => nil,
        :category_name => "Category Name"
      ),
      CharityCategory.create!(
        :charity => nil,
        :category_name => "Category Name"
      )
    ])
  end

  it "renders a list of charity_categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Category Name".to_s, :count => 2
  end
end
