class AddProductPriceToLineItem < ActiveRecord::Migration
  def up
    add_column :line_items, :price, :decimal
    
    
  end
  
  def down
    remove_column :line_items, :price
  end
end
