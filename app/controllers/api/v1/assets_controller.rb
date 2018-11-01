class Api::V1::AssetsController < ApplicationController
  skip_before_action :authorized

  def index
    @assets = Asset.all

    render json: @assets
  end



end
