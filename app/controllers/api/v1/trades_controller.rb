class Api::V1::TradesController < ApplicationController
  #skip_before_action :authorized, only: [:create]
  skip_before_action :authorized

  def create
    @trade = Trade.create(trade_params)
    if @trade.valid?

      render json: { trade: TradeSerializer.new(@trade)}, status: :created
    else
      render json: { error: 'failed to create trade' }, status: :not_acceptable
    end
  end

  private

  def trade_params
    params.require(:trade).permit(:user_id, :asset_id, :buy, :price, :quantity)

  end





end
