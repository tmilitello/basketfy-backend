class AddDivisorToAssetBaskets < ActiveRecord::Migration[7.0]
  def change
    add_column :asset_baskets, :divisor, :float
  end
end
