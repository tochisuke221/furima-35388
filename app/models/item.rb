class Item < ApplicationRecord
  
  belongs_to :user,dependent: :destroy
  

  with_options presence:true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :fee
    validates :prefecture_id
    validates :term_id
    validates :price
  end
  
end

# | user          | references | null:false,foreign_key: true |
# | name          | string     | null: false                  |
# | description   | text       | null: false                  |
# | category_id   | integer    | null: false                  |
# | status_id     | integer    | null: false                  |
# | fee_id        | integer    | null: false                  |
# | prefecture_id | integer    | null: false                  |
# | term_id       | integer    | null: false                  |
# | price         | integer    | null: false                  |
