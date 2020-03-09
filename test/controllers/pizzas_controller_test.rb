require 'test_helper'

class PizzasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pizzas_new_url
    assert_response :success
  end

end
