class ItemsController < ApplicationController
  # before_action :set_item, except: [:index, :new, :create]
# before_action :show_all_instance, only: [:show, :edit, :destroy]

  def index
    @items = Item.all

  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Product.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.includes(:images)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  

  def destroy
  end

end

private
  def item_params
    params.require(:item).permit(:item_name, :price, :images, :discription)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  

  


  
