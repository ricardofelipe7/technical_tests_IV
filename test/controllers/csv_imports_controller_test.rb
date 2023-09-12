require "test_helper"

class CsvImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get csv_imports_create_url
    assert_response :success
  end
end
