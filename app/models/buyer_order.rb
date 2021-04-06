class BuyerOrder
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:buyer_id ,:address_code ,:prefecture_id ,:city,:address_line,:phone_num,:building_name

  #validatesを記載

  with_options presence:true do
    validates :user_id
    validates :item_id
    validates :buyer_id         
    validates :address_code  
    validates :prefecture_id 
    validates :city          
    validates :address_line  
    validates :phone_num  
  end

  #テーブルに保存する
  def save
    buyer=Buyer.create(usesr_id:user_id,item_id:item_id)
    Order.create(buyer_id:buyer.user_id,address_code:address_code,prefecture_id:prefecture_id,city:city,address_line:address_line,phone_num:phone_num,building_name:building_name)
  end
end
