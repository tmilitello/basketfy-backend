class CreateAssetBaskets < ActiveRecord::Migration[7.0]
  def change
    create_table :asset_baskets do |t|
      t.integer :basket_id
      t.integer :asset_id
      t.float :weight
      t.string :status

      t.timestamps
    end
  end
end
