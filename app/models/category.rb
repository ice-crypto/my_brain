class Category < ApplicationRecord
  validates :title,
    presence: true
  validates :key,
    presence: true

  has_and_belongs_to_many :books
  has_many :category_relationships
  has_many :children, through: :category_relationships, source: :child
  has_many :reverses_of_relation, class_name: 'CategoryRelationship', foreign_key: 'child_id'
  has_many :parents, through: :reverses_of_relation, source: :category

  #function
  def self.json_to_relation(json_data)
    return false if json_data.blank?
    nodes = []
    json_data.each do |node|
      record = {title:node["title"],key:node["key"],root:false}
      if node["key"] == '0-0'
        record[:root] = true
      end
      if node.has_key?("children")
        children = json_to_relation(node["children"])
        category = Category.new(record)
        raise Exception.new("children save error") unless category.save
        children.each do |node_id|
          category.category_relationships.find_or_create_by(child_id: node_id)
        end
      else
        category = Category.new(record)
        raise Exception.new("leaf node save error") unless category.save!
      end
      nodes.push(category.id)
    end
    nodes
  end

  def self.relation_to_json(root_id)
    root_node = Category.find_by(id: root_id)
    tree_convert_loop(root_node)
  end

  def self.tree_convert_loop(node,result=[])
    if node.children.blank?
      result << {value:node.id,label:node.title}
      result
    else
      tmp_arr = []
      node.children.each do |node|
        tmp_arr = tree_convert_loop(node,tmp_arr)
      end
      result << {value:node.id,label:node.title,children:tmp_arr}
    end
  end
  private_class_method :tree_convert_loop
end
