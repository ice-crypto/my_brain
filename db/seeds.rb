# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
periods = [1,3,7,15,90,240,549,1460]
periods.each do |period|
  Period.new(period: period).save
end

formats = [0,1,2,3]
formats.each do |format|
  Format.new(problem_type:format).save
end

data = [
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

Category.json_to_relation(data)
