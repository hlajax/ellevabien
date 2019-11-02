class Category < ApplicationRecord
  belongs_to :administrateur
    extend FriendlyId
  friendly_id :titre, use: :slugged
  has_many :articles
end
