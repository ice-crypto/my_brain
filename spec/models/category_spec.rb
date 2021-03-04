require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "build category" do
    it "is success." do
      category = FactoryBot.build(:category)
      category.valid?
      expect(category).to be_valid
    end
  end
  describe "json_to_relation" do
    before(:each) do
      @data = '[{"title"=>"root", "key"=>"0-0", "children"=>[{"title"=>"p-node1", "key"=>"0-0-0", "children"=>[{"title"=>"p-node3", "key"=>"0-0-0-1"}, {"title"=>"p-node2", "key"=>"0-0-0-0"}]}]}]'
      p "before_category_lastid"
      p Category.maximum(:id)
    end
    it "json形式のobjをcategoryオブジェクトへ変換" do
      before_category_lastid = Category.maximum(:id).nil? ? 0 : Category.maximum(:id)
      t=Category.json_to_relation(@data)
      p "result"
      p t
      expect(t[0].kind_of?(Integer)).to eq true
    end
  end
  describe "relation_to_json"
end
