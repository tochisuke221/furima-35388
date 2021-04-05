class Order < ApplicationRecord

  belongs_to :buyer

  with_options presence:true do
    validates :buyer         
    validates :address_code  
    validates :prefecture_id 
    validates :city          
    validates :address_line  
    validates :phone_num  
  end
end






