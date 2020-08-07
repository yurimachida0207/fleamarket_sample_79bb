class ItemsController < ApplicationController

  before_action :set_item, except: [:show, :new, :create, :show, :get_category_children, :get_category_grandchildren]

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def show
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
      redirect_to new_item_path
    end
  end
 

  def show
    @item = Item.find(params[:id])
    @items = Item.includes(:images)
    @user = User.find_by(id: @item.user_id)
    @category = Category.find(params[:id])
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
       @item = Item.find(params[:id])
    if @item.user.id == current_user.id
       @item.destroy
       redirect_to root_path
    end
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :brand, :condition_id, :postage_payer, :prefecture_id, :preparation_id, :price, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end