class Review < ApplicationRecord
  validates :detail, presence: true
  belongs_to :user
  has_many :comments
end
