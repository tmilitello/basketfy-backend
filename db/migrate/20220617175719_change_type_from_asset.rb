class ChangeTypeFromAsset < ActiveRecord::Migration[7.0]
  def change
    remove_column :assets, :type, :string
  end
end
