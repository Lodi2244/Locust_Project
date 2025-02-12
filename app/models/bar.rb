class Bar < ApplicationRecord
  
  belongs_to :price
  has_many :gigs
  has_many :bar_tags
  has_many :tags, through: :bar_tags
  has_many :favorites
  has_many :users, through: :favorites

end
