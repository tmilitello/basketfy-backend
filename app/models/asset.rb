class Asset < ApplicationRecord
  has_many :asset_tags
  has_many :tags, through: :asset_tags
  has_many :asset_baskets
  has_many :baskets, through: :asset_baskets

end


