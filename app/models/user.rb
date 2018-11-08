#require "pry"

class User < ApplicationRecord
  has_secure_password

  has_many :trades
  has_many :assets, through: :trades

  validates :username, uniqueness: {case_sensitive: false}


#########################################################################
#methods for calculating position and PnL#
#########################################################################
#central concept: profit/loss (PnL) = (live price - volume weighted average price (VWAP)) * net position
#ex. if user is short 1 coin at 6,000 USD and live price is 6,100 USD
# PnL = (6,100 - 6,000) * (-1) = -100 USD


  #calculate the net position in a given crypto for a user
  def positions
    position_array = [ ]
    position_obj = { }
    self.trades.each do |trade|

      #check if the asset exists
      if !position_obj[trade.asset.symbol]

      #check if a long position
        if trade.buy == true
          position_obj[trade.asset.symbol] = {"net_position"=> trade.quantity, "weighted_price"=> trade.price}

        #else position is a sale
        else
          position_obj[trade.asset.symbol] = {"net_position" => -trade.quantity, "weighted_price"=> trade.price}
        end

      else
        #byebug
        if trade.buy == true
          position_obj[trade.asset.symbol]["weighted_price"] = ((position_obj[trade.asset.symbol]["net_position"]*position_obj[trade.asset.symbol]["weighted_price"])+(trade.quantity*trade.price))/(position_obj[trade.asset.symbol]["net_position"]+trade.quantity)
          position_obj[trade.asset.symbol]["net_position"] += trade.quantity

        #else position is a sale
        else
          position_obj[trade.asset.symbol]["weighted_price"] = ((position_obj[trade.asset.symbol]["net_position"]*position_obj[trade.asset.symbol]["weighted_price"])-(trade.quantity*trade.price))/(position_obj[trade.asset.symbol]["net_position"]-trade.quantity)
          position_obj[trade.asset.symbol]["net_position"] -= trade.quantity
        end
      end
      puts position_obj
    end

    position_array = position_obj.map do |key, data|
      {"symbol"=> key, "net_position"=> data["net_position"], "weighted_price" =>data["weighted_price"] }
    end
    position_array
  end


  # #calculate volume weighted average price
  # #VWAP = (sum(P*Q)/(sum Q))
  # def weighted_price
  #
  #   #check if the user has any trades
  #   if self.net_position.length > 0
  #
  #   else
  #     total_usd = 0
  #
  #     self.trades.each do |trade|
  #       if trade.buy == true
  #         total_usd += (trade.price * trade.quantity)
  #       else
  #         total_usd -= (trade.price * trade.quantity)
  #       end
  #     end
  #
  #     vwap = total_usd/self.net_position
  #   end
  # end
  #





end  #end User class
