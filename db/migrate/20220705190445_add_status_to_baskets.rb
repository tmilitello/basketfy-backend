class AddStatusToBaskets < ActiveRecord::Migration[7.0]
  def change
    add_column :baskets, :status, :string
  end
end
