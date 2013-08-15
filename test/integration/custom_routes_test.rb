require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "test /login route opens the login page" do
  	get '/login'
  	assert_response :success
  end

  test "test /logout route opens the log out page" do
  	get '/logout'
  	assert_response :redirect
  	assert_redirected_to '/'
  end

  test "test /register route opens the sign up page" do
  	get '/register'
  	assert_response :success
  end

  test "that a profile page works" do 
    get '/HonestMerchant'
    assert_response :success
  end

end