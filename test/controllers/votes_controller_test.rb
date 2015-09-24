require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  test "should post create" do
    voter = Voter.create(name: "VotingTest", party: "YoMama")
    byebug
    request.headers["HTTP_AUTHORIZATION"] = %{Token #{voter.token}}
    post :create, params: { voter_id: "#{voter.id}", candidate_id: "#{candidates(:test2).id}" }
    assert_response :success

    body_response = JSON.parse(response.body)
    assert_equal candidates(:test2).id, body["candidate_id"]
    assert_equal voter.id, body["voter_id"]
  end

  test "should delete destroy" do
    request.headers["HTTP_AUTHORIZATION"] = %{Token #{votes(:test_one).id}}
    delete :destroy, id:votes(:test_one).id
    assert_response :success
    assert votes(:test_one).destroyed?
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
