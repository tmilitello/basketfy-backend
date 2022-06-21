class User < ApplicationRecord
  has_many :baskets		
  has_many :comments
end
