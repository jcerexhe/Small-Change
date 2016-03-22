require 'rails_helper'

RSpec.describe "charity_categories/edit", type: :view do
  before(:each) do
    @charity_category = assign(:charity_category, CharityCategory.create!(
      :charity => nil,
      :category_name => "MyString"
    ))
  end

  it "renders the edit charity_category form" do
    render

    assert_select "form[action=?][method=?]", charity_category_path(@charity_category), "post" do

      assert_select "input#charity_category_charity_id[name=?]", "charity_category[charity_id]"

      assert_select "input#charity_category_category_name[name=?]", "charity_category[category_name]"
    end
  end
end
