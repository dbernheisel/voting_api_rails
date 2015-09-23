require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  test "should get index" do
    count1 = Candidate.count
    get :index, format: "json"
    assert_response :success
    count2 = JSON.parse(response.body).count
    assert_equal count1, count2
  end

  test "should get show" do
    get :show, id:candidates(:test1).id, format: "json"
    assert_response :success
    body = JSON.parse(response.body)
    assert_equal "Trump", body["name"]
  end

end
