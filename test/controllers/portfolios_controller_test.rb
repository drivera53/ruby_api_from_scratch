require "test_helper"

class PortfoliosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portfolio = portfolios(:one)
  end

  test "should get index" do
    get portfolios_url, as: :json
    assert_response :success
  end

  test "should create portfolio" do
    assert_difference("Portfolio.count") do
      post portfolios_url, params: { portfolio: { current_balance: @portfolio.current_balance, description: @portfolio.description, initial_balance: @portfolio.initial_balance, name: @portfolio.name, user_id: @portfolio.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show portfolio" do
    get portfolio_url(@portfolio), as: :json
    assert_response :success
  end

  test "should update portfolio" do
    patch portfolio_url(@portfolio), params: { portfolio: { current_balance: @portfolio.current_balance, description: @portfolio.description, initial_balance: @portfolio.initial_balance, name: @portfolio.name, user_id: @portfolio.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy portfolio" do
    assert_difference("Portfolio.count", -1) do
      delete portfolio_url(@portfolio), as: :json
    end

    assert_response :no_content
  end
end
