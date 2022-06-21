class Basket < ApplicationRecord
  has_many :asset_baskets
  has_many :assets, through: :asset_baskets
  has_many :comments
  belongs_to :user

end

