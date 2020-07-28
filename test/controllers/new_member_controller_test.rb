require 'test_helper'

class NewMemberControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get new_member_index_url
    assert_response :success
  end

end
