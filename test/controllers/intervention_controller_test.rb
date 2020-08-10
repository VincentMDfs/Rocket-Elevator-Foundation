require 'test_helper'

class InterventionControllerTest < ActionDispatch::IntegrationTest
  test "should get intervention" do
    get intervention_intervention_url
    assert_response :success
  end

end
