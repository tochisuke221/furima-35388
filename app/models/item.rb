class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user,dependent: :destroy
  belongs_to :category_id
  belongs_to :status_id
  belongs_to :fee_id
  belongs_to :prefecture_id
  belongs_to :term_id

  validates :price,presence:true,format:{with: /\A[0-9]+\z/},numericality: { other_than: 1 } 
  
  with_options presence:true do
    validates :name
    validates :description
    validates :image
  end

  

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :prefecture_id
    validates :term_id
  end


end
