class ItemsController < ApplicationController

  before_action :move_to_index,only:[:new,:create] #のちのち、except[:show,:index]の変更する



  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  


  private

  def item_params
    params.require(:item).permit(:name,:description,:category_id,:status_id,:fee_id,  :prefecture_id,:term_id,:price,:image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
