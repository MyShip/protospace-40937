class Prototype < ApplicationRecord
  validates :title,               presence: true
  validates :catch_copy,          presence: true
  validates :concept,             presence: true

  has_many :user
  has_many :comments
  has_one_attached :image
end
