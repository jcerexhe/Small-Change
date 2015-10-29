require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get faq" do
    get :faq
    assert_response :success
  end

  test "should get about_the_founders" do
    get :about_the_founders
    assert_response :success
  end

  test "should get t_and_c" do
    get :t_and_c
    assert_response :success
  end

  test "should get contact_us" do
    get :contact_us
    assert_response :success
  end

  test "should get our_goal" do
    get :our_goal
    assert_response :success
  end

  test "should get I_am_a_charity" do
    get :I_am_a_charity
    assert_response :success
  end

  test "should get I_am_a_news_organisation" do
    get :I_am_a_news_organisation
    assert_response :success
  end

end
