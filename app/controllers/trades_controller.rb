class TradesController < ApplicationController
  before_action :set_trade, only: %i[ show update destroy ]

  # GET /trades
  def index
    @trades = Trade.all

    render json: @trades
  end

  # GET /trades/1
  def show
    render json: @trade
  end

  # POST /trades
  def create
    @trade = Trade.new(trade_params)
    user = User.find_by_id(trade_params[:user_id])
    portfolio = user.portfolios.find_by_id(trade_params[:portfolio_id])
    coin = user.portfolios.first.coins.where(coin_id:trade_params[:coin_id])
    portfolio.current_balance = portfolio.current_balance - (trade_params[:quantity] * trade_params[:price])
    
    if @trade.save && portfolio.current_balance > 0
      if coin.count > 0  
        # portfolio.save
        coin[0].quantity = coin[0].quantity + trade_params[:quantity]
        coin[0].save
      else 
        Coin.create(:coin_name => trade_params[:coin_name], :coin_id => trade_params[:coin_id], :average_price => trade_params[:price], :quantity => trade_params[:quantity], :user_id => trade_params[:user_id], :portfolio_id => trade_params[:portfolio_id], :image => trade_params[:image])
      end
      portfolio.save
      user = User.find_by_id(trade_params[:user_id])
      user_json = user.to_json(:include => [
        :portfolios, :trades, :coins])
      # render json: @trade, status: :created, location: @trade
      render json: {
        user: user_json
      }
    else
      # render json: @trade.errors, status: :unprocessable_entity
      render json: {error: "You don't have enough buying power for this order."}
    end
  end

  # PATCH/PUT /trades/1
  def update
    if @trade.update(trade_params)
      render json: @trade
    else
      render json: @trade.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trades/1
  def destroy
    @trade.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trade_params
      params.require(:trade).permit(:coin_name, :coin_id, :price, :quantity, :user_id, :portfolio_id, :image)
    end
end
