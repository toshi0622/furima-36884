class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :item_category_id, :item_state_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if @item.user_id != current_user.id || @item.order != nil
      redirect_to root_path
    end
  end

end