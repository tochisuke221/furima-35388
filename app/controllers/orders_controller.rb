class OrdersController < ApplicationController
  #のちのちに、@item=Item.findはまとめる
  
  def index
    @item=Item.find(params[:id])
    @buyer_order=BuyerOrder.new
    
  end

  def create
    @item=Item.find(params[:id])
    @buyer_order=BuyerOrder.new(buyer_order_params)
    if @buyer_order.valid?
      @buyer_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_order_params
    params.require(:buyer_order).permit(:building_name,:buyer_id ,:address_code ,:prefecture_id ,:city,:address_line,:phone_num).merge(user_id:current_user.id,item_id:params[:id])
  end

end
