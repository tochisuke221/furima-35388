class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :buyer        
      t.string     :address_code 
      t.integer    :prefecture_id
      t.string     :city         
      t.string     :address_line 
      t.string     :building_name
      t.string     :phone_num    
      t.timestamps
    end
  end
end
