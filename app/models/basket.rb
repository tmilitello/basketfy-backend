class Basket < ApplicationRecord
  has_many :asset_baskets
  has_many :assets, through: :asset_baskets
  has_many :comments
  has_many :tags, through: :assets
  belongs_to :user

end

