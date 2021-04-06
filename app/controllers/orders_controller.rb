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
       pay_item(@item)
      @buyer_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_order_params
    params.require(:buyer_order).permit(:building_name,:buyer_id ,:address_code ,:prefecture_id ,:city,:address_line,:phone_num).merge(buyer_id:current_user.id,user_id:current_user.id,item_id:params[:id],
    token:params[:token])
  end

  def pay_item(item)
    Payjp.api_key = "sk_test_ce45a5a4ef616b5ecab7da1e" 
    Payjp::Charge.create(
      amount: item.price,      
      card: buyer_order_params[:token],    
      currency: 'jpy'         
    )
  end

end
