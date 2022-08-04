class ChangeWeightinAssetBaskets < ActiveRecord::Migration[7.0]
  def change
    rename_column :asset_baskets, :weight, :initial_weight
  end
end
