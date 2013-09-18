require 'test_helper'

module PigeonFeet
  class ComponentsControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end

  end
end
