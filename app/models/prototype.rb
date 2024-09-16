class Prototype < ApplicationRecord
  validates :title,               presence: true
  validates :catch_copy,          presence: true
  validates :concept,             presence: true

  belongs_to :user
  has_many :comments,             dependent: :destroy

  validates :image, presence: true, unless: :was_attached?

  has_one_attached :image

  def was_attached?
    self.image.attached?
  end
end
