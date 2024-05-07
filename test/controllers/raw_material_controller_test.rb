require "test_helper"

class RawMaterialControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get raw_material_index_url
    assert_response :success
  end

  test "should get show" do
    get raw_material_show_url
    assert_response :success
  end

  test "should get add" do
    get raw_material_add_url
    assert_response :success
  end

  test "should get update" do
    get raw_material_update_url
    assert_response :success
  end

  test "should get delete" do
    get raw_material_delete_url
    assert_response :success
  end
end
