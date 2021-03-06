class Picture < ApplicationRecord
  validates :image, :title, presence: true

  has_one_attached :image, dependent: :destroy
  belongs_to :user
  has_many :comments, dependent: :destroy

  is_impressionable
  acts_as_votable
end
