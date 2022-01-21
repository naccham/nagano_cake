class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @genres = Genre
  end
  
  def about
  end
end
