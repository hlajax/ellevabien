class Article < ApplicationRecord
  belongs_to :category
  belongs_to :auteur
  mount_uploader :image, ImageUploader
  extend FriendlyId
  friendly_id :titre, use: :slugged
end
