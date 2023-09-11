require "test_helper"

class CsvImportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @csv_import = csv_imports(:one)
  end

  test "should get index" do
    get csv_imports_url, as: :json
    assert_response :success
  end

  test "should create csv_import" do
    assert_difference("CsvImport.count") do
      post csv_imports_url, params: { csv_import: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show csv_import" do
    get csv_import_url(@csv_import), as: :json
    assert_response :success
  end

  test "should update csv_import" do
    patch csv_import_url(@csv_import), params: { csv_import: {  } }, as: :json
    assert_response :success
  end

  test "should destroy csv_import" do
    assert_difference("CsvImport.count", -1) do
      delete csv_import_url(@csv_import), as: :json
    end

    assert_response :no_content
  end
end
