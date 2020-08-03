class ItemsController < ApplicationController

  before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]

  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
    @item.images.new

    @category_parent_array = ["---"]
    @category_parent_array = Category.where(ancestry: nil)
  end
  
  def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render 'new'
      end
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

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end  

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id,  :price,:brand, :condition, :postage_payer, :ship_form,:ship_preparation,images_attributes: [:image, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end