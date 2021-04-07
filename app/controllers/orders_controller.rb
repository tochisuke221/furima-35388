class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :is_this_sell_out?, only: [:index, :create]

  # のちのちに、@item=Item.findはまとめる

  def index
    @buyer_order = BuyerOrder.new
  end

  def create
    @buyer_order = BuyerOrder.new(buyer_order_params)
    if @buyer_order.valid?
      pay_item
      @buyer_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_order_params
    params.require(:buyer_order).permit(:building_name, :buyer_id, :address_code, :prefecture_id, :city, :address_line, :phone_num).merge(buyer_id: current_user.id, user_id: current_user.id, item_id: params[:id],
                                                                                                                                          token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user.id
  end

  def is_this_sell_out?
    redirect_to root_path unless @item.buyer.nil?
  end
end
