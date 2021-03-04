class CategoryRelationship < ApplicationRecord
  belongs_to :category
  belongs_to :child, class_name: 'Category'
end
