require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  test "should post create" do
    get :create
    assert_response :success
  end

  test "should delete destroy" do
    delete :destroy, id:votes(:test_one).id
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
