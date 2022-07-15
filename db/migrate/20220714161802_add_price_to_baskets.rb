class AddPriceToBaskets < ActiveRecord::Migration[7.0]
  def change
    add_column :baskets, :price, :string
  end
end
