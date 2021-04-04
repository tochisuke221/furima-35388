class Item < ApplicationRecord
  extends ActiveHash::Association::ActiveRecordExtensions

  belongs_to :user,dependent: :destroy
  belongs_to :category_id
  belongs_to :status_id
  belongs_to :fee_id
  belongs_to :prefecture_id
  belongs_to :term_id

  with_options presence:true do
    validates :name
    validates :description
    validates :price
    validates :image
  end


  with_options numericallity: { other_than : 1 }
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :prefecture_id
    validates :term_id
  end


end
