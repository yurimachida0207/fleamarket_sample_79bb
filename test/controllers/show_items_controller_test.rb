require 'test_helper'

class ShowItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get show_items_index_url
    assert_response :success
  end

end
