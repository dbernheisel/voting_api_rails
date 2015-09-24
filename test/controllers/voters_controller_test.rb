require 'test_helper'

class VotersControllerTest < ActionController::TestCase

  setup do
    @request.headers['Accept'] = Mime::JSON
    @request.headers['Content-Type'] = Mime::JSON.to_s
  end

  test "should GET show" do
    get :show, id:voters(:test_one).id, format: "json"
    assert_equal 401, response.status

    request.headers["HTTP_AUTHORIZATION"] = %{Token #{voters(:test_one).token}}
    get :show, id: voters(:test_one).id, format: "json"
    assert_response :success

    body = JSON.parse(response.body)
    assert_equal "Tester", body["name"]
  end

  test "should POST create" do
    post :create, {name: "Tester3", party: "Hilary"}, format: "json"
    assert_response :success
    body = JSON.parse(response.body)
    assert_equal "Tester3", body["name"]
  end

  test "should PUT update" do
    request.headers["HTTP_AUTHORIZATION"] = %{Token #{voters(:test_one).token}}
    get :show, id:voters(:test_one).id, format: "json"
    body_get = JSON.parse(response.body)
    assert_equal "Tester", body_get["name"]
    assert_equal "None", body_get["party"]


    put :update, {id: voters(:test_one).id, name: "Tester1", party: "Trumper"}, format: "json"
    assert_response :success
    body_put = JSON.parse(response.body)
    assert_equal "Tester1", body_put["name"]
    assert_equal "Trumper", body_put["party"]
  end

  def current_resource_owner
    Voter.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
