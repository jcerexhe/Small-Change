require 'rails_helper'

RSpec.describe "charity_categories/new", type: :view do
  before(:each) do
    assign(:charity_category, CharityCategory.new(
      :charity => nil,
      :category_name => "MyString"
    ))
  end

  it "renders new charity_category form" do
    render

    assert_select "form[action=?][method=?]", charity_categories_path, "post" do

      assert_select "input#charity_category_charity_id[name=?]", "charity_category[charity_id]"

      assert_select "input#charity_category_category_name[name=?]", "charity_category[category_name]"
    end
  end
end
