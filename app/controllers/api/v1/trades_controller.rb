class Api::V1::TradesController < ApplicationController
  #skip_before_action :authorized, only: [:create]
  skip_before_action :authorized

  def create
    
    @trade = Trade.create(user_id: trade_params["user_id"], asset_id: Asset.find_by(symbol:trade_params["symbol"]).id, buy: trade_params["buy"],price: trade_params["price"],quantity: trade_params["quantity"])
    if @trade.valid?

      render json: { trade: TradeSerializer.new(@trade)}, status: :created
    else
      render json: { error: 'failed to create trade' }, status: :not_acceptable
    end
  end

  private

  def trade_params
    params.require(:trade).permit(:user_id, :symbol, :buy, :price, :quantity)

  end





end
