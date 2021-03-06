class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :are_you_seller?, only: [:destroy, :update, :edit]
  before_action :is_this_sell_out?, only: [:edit, :update]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :fee_id, :prefecture_id, :term_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def are_you_seller?
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def is_this_sell_out?
    redirect_to root_path unless @item.buyer.nil?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
