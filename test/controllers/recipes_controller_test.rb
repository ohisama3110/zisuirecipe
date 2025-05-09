require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get recipes_new_url
    assert_response :success
  end

  test "should get index" do
    get recipes_index_url
    assert_response :success
  end

  test "should get show" do
    get recipes_show_url
    assert_response :success
  end

  test "should get create" do
    get recipes_create_url
    assert_response :success
  end

  test "should get edit" do
    get recipes_edit_url
    assert_response :success
  end

  test "should get update" do
    get recipes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get recipes_destroy_url
    assert_response :success
  end
end
