class BuyerOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :buyer_id, :address_code, :prefecture_id, :city, :address_line, :phone_num, :building_name,
                :token

  # validatesを記載

  validates :address_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :buyer_id
    validates :city
    validates :address_line
    validates :phone_num, format: { with: /\A\d{11}\z/ }
    validates :token
  end

  # テーブルに保存する
  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Order.create(buyer_id: buyer.id, address_code: address_code, prefecture_id: prefecture_id, city: city, address_line: address_line,
                 phone_num: phone_num, building_name: building_name)
  end
end
