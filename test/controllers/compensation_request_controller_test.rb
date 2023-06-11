require 'test_helper'

class CompensationRequestsControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    @compensation_request = CompensationRequest.create(actor_type: 'Employee', actor_id: @user.actor_id, amount: 10, currency: 'USD', status: :pending)
  end

  test "should get index" do
    get :index

    assert_response :success
  end
end
