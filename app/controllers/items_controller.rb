class ItemsController < ApplicationController
before_action :set_item, only: [:show, :edit]
# before_action :show_all_instance, only: [:show, :edit, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    tweet.update(tweet_params)
  end

  # def update_done
  #   @item_update = Item.order("updated_at DESC").first
  # end

  def destroy
  end

end

private
  def item_params
    params.require(:item).permit(:name, :image, :text)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def ensure_current_user
    # item = Item.find(params[:id])
    # if item.user_id != current_user.id
    #   redirect_to action: :index
    # end
  end

  def category_parent_array
    # @category_parent_array = Category.where(ancestry: nil).each do |parent|
    # end
  end

  def show_all_instance
    # @user = User.find(@item.user_id)
    # @images = Image.where(item_id: params[:id])
    # @images_first = Image.where(item_id: params[:id]).first
    # @category_id = @item.category_id
    # @category_parent = Category.find(@category_id).parent.parent
    # @category_child = Category.find(@category_id).parent
    # @category_grandchild = Category.find(@category_id)
  end


  
