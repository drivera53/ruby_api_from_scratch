require "test_helper"

class TradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trade = trades(:one)
  end

  test "should get index" do
    get trades_url, as: :json
    assert_response :success
  end

  test "should create trade" do
    assert_difference("Trade.count") do
      post trades_url, params: { trade: { coin_id: @trade.coin_id, coin_name: @trade.coin_name, image: @trade.image, portfolio_id: @trade.portfolio_id, price: @trade.price, quantity: @trade.quantity, user_id: @trade.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show trade" do
    get trade_url(@trade), as: :json
    assert_response :success
  end

  test "should update trade" do
    patch trade_url(@trade), params: { trade: { coin_id: @trade.coin_id, coin_name: @trade.coin_name, image: @trade.image, portfolio_id: @trade.portfolio_id, price: @trade.price, quantity: @trade.quantity, user_id: @trade.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy trade" do
    assert_difference("Trade.count", -1) do
      delete trade_url(@trade), as: :json
    end

    assert_response :no_content
  end
end
