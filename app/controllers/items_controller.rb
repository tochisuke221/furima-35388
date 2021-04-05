class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:destroy] # のちのち、except[:show,:index]の変更する
  before_action :move_to_index,only:[:destroy] 

  def index
    @items = Item.all.order(created_at: 'DESC')
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
    @item = Item.find(params[:id])
  end

  def destroy
    item=Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :fee_id, :prefecture_id, :term_id, :price,:image).merge(user_id: current_user.id)
  end

  def move_to_index
    item=Item.find(params[:id])
    unless current_user.id==item.user.id
      redirect_to root_path
    end
  end
end
