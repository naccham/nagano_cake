class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!,except: [:top]
  def top
    @orders = Order.all
    @total_amount = 0

  end
end
