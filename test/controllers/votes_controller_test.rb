require 'test_helper'

class VotesControllerTest < ActionController::TestCase

  setup do
    @request.headers['Accept'] = Mime::JSON
    @request.headers['Content-Type'] = Mime::JSON.to_s
  end

  test "should post create" do
    voter = Voter.create(name: "VotingTest", party: "YoMama")
    request.headers["HTTP_AUTHORIZATION"] = "Token #{voter.token}"
    post :create, voter_id: voter.id, candidate_id: candidates(:test2).id
    assert_response :success

    body_response = JSON.parse(response.body)
    assert_equal candidates(:test2).id, body_response["candidate_id"]
    assert_equal voter.id, body_response["voter_id"]
  end

  test "should delete destroy" do
    voter = Voter.create(name: "VotingTest", party: "YoMama")
    request.headers["HTTP_AUTHORIZATION"] = "Token #{voter.token}"
    post :create, voter_id: voter.id, candidate_id: candidates(:test2).id
    assert_response :success
    body_response = JSON.parse(response.body)

    request.headers["HTTP_AUTHORIZATION"] = "Token #{voter.token}"
    assert_difference 'Vote.count', -1 do
      delete :destroy, id: body_response["id"]
    end

  end

  test "should get index" do
    vcount = Vote.count
    get :index
    assert_response :success
    assert_equal vcount, JSON.parse(response.body).length
  end

end
