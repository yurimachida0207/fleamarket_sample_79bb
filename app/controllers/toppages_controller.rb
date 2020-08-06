class ToppagesController < ApplicationController
  def index
    @items = Item.includes(:images).order('updated_at DESC').first(4)
  end
end
