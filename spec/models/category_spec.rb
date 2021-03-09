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
      @data = [
        {
          "title"=>"root",
          "key"=>"0-0",
          "children"=>
          [
            {
              "title"=>"p-node1",
              "key"=>"0-0-0",
              "children"=>
              [
                {
                  "title"=>"p-node3",
                  "key"=>"0-0-0-1"
                },
                {
                  "title"=>"p-node2",
                  "key"=>"0-0-0-0"
                }
              ]
            }
          ]
        }
      ]

    end
    it "json形式のobjをcategoryオブジェクトへ変換" do
      t=Category.json_to_relation(@data)
      expect(t[0].kind_of?(Integer)).to eq true
      expect(t[0]%4).to eq 0
    end
  end
  describe "relation_to_json" do
    before(:each) do
      @data = [
        {
          "title"=>"root",
          "key"=>"0-0",
          "children"=>
          [
            {
              "title"=>"p-node1",
              "key"=>"0-0-0",
              "children"=>
              [
                {
                  "title"=>"p-node3",
                  "key"=>"0-0-0-1"
                },
                {
                  "title"=>"p-node2",
                  "key"=>"0-0-0-0"
                }
              ]
            }
          ]
        }
      ]
    end
    it "record形式をjson形式に変換" do
      expect(Category.relation_to_json('root')).to be @data
    end
  end
end
