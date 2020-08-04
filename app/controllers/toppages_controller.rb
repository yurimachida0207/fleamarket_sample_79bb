class ToppagesController < ApplicationController
  def index
    @items = Item.includes(:images).order('updated_at DESC').first(4)
    # @rand_items = Item.includes(:images).order("RAND()").limit(3)
  end
end
