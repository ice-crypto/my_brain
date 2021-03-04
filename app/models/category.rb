class Category < ApplicationRecord
  validates :title,
    presence: true
  validates :key,
    presence: true
  validates :group,
    presence: true

  has_and_belongs_to_many :books
  has_many :category_relationships
  has_many :children, through: :category_relationships, source: :child
  has_many :reverses_of_relation, class_name: 'CategoryRelationship', foreign_key: 'child_id'
  has_many :parents, through: :reverses_of_relation, source: :category

  #function
  def self.json_to_relation(json_data,root_id=-1)
    return false if json_data.blank?
    nodes = []
    json_data.each do |node|
      record = {title:node["title"],key:node["key"]}
      if node["key"] == '0-0'
        record[:root] = true
        record[:group] = -1
        category = Category.new(record)
        raise Exception.new("root node save error") unless category.save
        if node.has_key?("children")
          children = json_to_relation(node["children"],root_id)
          record[:group] = root_id
          category = Category.new(record)
          raise Exception.new("children save error") unless category.save
          children.each do |node_id|
            category.category_relationships.find_or_create_by(child_id: node_id)
          end
        end
      elsif node.has_key?("children")
        children = json_to_relation(node["children"],root_id)
        record[:group] = root_id
        category = Category.new(record)
        raise Exception.new("children save error") unless category.save
        children.each do |node_id|
          category.category_relationships.find_or_create_by(child_id: node_id)
        end
      else
        record[:group] = root_id
        category = Category.new(record)
        raise Exception.new("leaf node save error") unless category.save!
      end
      nodes.push(category.id)
    end
    nodes
  end
end
