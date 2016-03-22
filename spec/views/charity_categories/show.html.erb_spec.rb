require 'rails_helper'

RSpec.describe "charity_categories/show", type: :view do
  before(:each) do
    @charity_category = assign(:charity_category, CharityCategory.create!(
      :charity => nil,
      :category_name => "Category Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Category Name/)
  end
end
