class ItemsController < ApplicationController
  def index
  end
   
  def destroy
    if @item.destroy
  end
end

