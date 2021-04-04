class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,null:false,foreign_key:true
      t.string :name,null:false
      t.text :description,null:false
      t.integer :category_id,null:false
      t.integer :status_id,null:false
      t.integer :fee_id,null:false
      t.integer :prefecture_id,null:false
      t.integer :term_id,null:false
      t.integer :price,null:false
      t.timestamps
    end
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
