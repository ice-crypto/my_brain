class Category < ApplicationRecord
  validates :price,
    presence: true
  validates :categories,
    presence: true
  validates :published_at,
    presence: true

  has_and_belongs_to_many :books
end
