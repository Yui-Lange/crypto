require 'test_helper'

class CryptaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cryptum = crypta(:one)
  end

  test "should get index" do
    get crypta_url
    assert_response :success
  end

  test "should get new" do
    get new_cryptum_url
    assert_response :success
  end

  test "should create cryptum" do
    assert_difference('Cryptum.count') do
      post crypta_url, params: { cryptum: { amount_owned: @cryptum.amount_owned, cost_per: @cryptum.cost_per, symbol: @cryptum.symbol, user_id: @cryptum.user_id } }
    end

    assert_redirected_to cryptum_url(Cryptum.last)
  end

  test "should show cryptum" do
    get cryptum_url(@cryptum)
    assert_response :success
  end

  test "should get edit" do
    get edit_cryptum_url(@cryptum)
    assert_response :success
  end

  test "should update cryptum" do
    patch cryptum_url(@cryptum), params: { cryptum: { amount_owned: @cryptum.amount_owned, cost_per: @cryptum.cost_per, symbol: @cryptum.symbol, user_id: @cryptum.user_id } }
    assert_redirected_to cryptum_url(@cryptum)
  end

  test "should destroy cryptum" do
    assert_difference('Cryptum.count', -1) do
      delete cryptum_url(@cryptum)
    end

    assert_redirected_to crypta_url
  end
end
