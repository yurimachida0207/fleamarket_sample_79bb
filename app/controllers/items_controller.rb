class ItemsController < ApplicationController
  before_action :category_parent_array, only: [ :edit]
  before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]
  before_action :show_all_instance, only: [ :edit, :show, :destroy]

  def index
    @items = Item.includes(:images).order('created_at DESC')
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
    @items = Item.includes(:images)
    @user = User.find_by(id: @item.user_id)
    @category = Category.find(params[:id])
    if user_signed_in?
     @hello_user = User.find(current_user.id)
    end
    @categories = Category.find(params[:id])
  end

  def edit
    grandchild = @item.category
    child = grandchild.parent

    if @category_id == 46 or @category_id == 74 or @category_id == 134 or @category_id == 142 or @category_id == 147 or @category_id == 150 or @category_id == 158
    else
      @parent_array = []
      @parent_array << @item.category.parent.parent.name
      @parent_array << @item.category.parent.parent.id
    
    end
      @category_children_array = Category.where(ancestry: child.ancestry)
      @child_array = []
      @child_array << child.name
      @child_array << child.id
      
      @category_grandchildren_array = Category.where(ancestry: grandchild.ancestry)
      @grandchild_array = []
      @grandchild_array << grandchild.name
      @grandchild_array << grandchild.id
  end

  def update
    if item_params[:images_attributes].nil?
      flash.now[:alert] = '更新できませんでした 【画像を１枚以上入れてください】'
      render :edit
    else
      exit_ids = []
      item_params[:images_attributes].each do |a,b|
        exit_ids << item_params[:images_attributes].dig(:"#{a}",:id).to_i
      end
      ids = Image.where(item_id: params[:id]).map{|image| image.id }
      delete__db = ids - exit_ids
      Image.where(id:delete__db).destroy_all
      @item.touch
      if @item.update(item_params)
         redirect_to root_path
      else
        flash.now[:alert] = '更新できませんでした'
        render :edit
      end
    end
  end

  def destroy
       @item = Item.find(params[:id])
    if @item.user.id == current_user.id && @item.destroy
       redirect_to root_path
       flash.now[:alert] = '商品データを削除しました'
    else
      redirect_to item_path(item.id)
      flash.now[:alert] = '商品の削除に失敗しました'
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

  def category_parent_array
    @category_parent_array = Category.where(ancestry: nil)
  end

  def show_all_instance
    @user = User.find(@item.user_id)
    @images = Image.where(item_id: params[:id])
    @images_first = Image.where(item_id: params[:id]).first
    @category_id = @item.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end
end