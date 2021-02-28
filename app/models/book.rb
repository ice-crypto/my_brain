class Book < ApplicationRecord
  validates :price,
    presence: true
  validates :categories,
    presence: true
  validates :published_at,
    presence: true

  has_and_belongs_to_many :problems
  has_and_belongs_to_many :authors
end
