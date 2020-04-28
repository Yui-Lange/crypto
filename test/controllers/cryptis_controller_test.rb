require 'test_helper'

class CryptisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crypti = cryptis(:one)
  end

  test "should get index" do
    get cryptis_url
    assert_response :success
  end

  test "should get new" do
    get new_crypti_url
    assert_response :success
  end

  test "should create crypti" do
    assert_difference('Crypti.count') do
      post cryptis_url, params: { crypti: { amount_owned: @crypti.amount_owned, cost_per: @crypti.cost_per, symbol: @crypti.symbol, user_id: @crypti.user_id } }
    end

    assert_redirected_to crypti_url(Crypti.last)
  end

  test "should show crypti" do
    get crypti_url(@crypti)
    assert_response :success
  end

  test "should get edit" do
    get edit_crypti_url(@crypti)
    assert_response :success
  end

  test "should update crypti" do
    patch crypti_url(@crypti), params: { crypti: { amount_owned: @crypti.amount_owned, cost_per: @crypti.cost_per, symbol: @crypti.symbol, user_id: @crypti.user_id } }
    assert_redirected_to crypti_url(@crypti)
  end

  test "should destroy crypti" do
    assert_difference('Crypti.count', -1) do
      delete crypti_url(@crypti)
    end

    assert_redirected_to cryptis_url
  end
end
