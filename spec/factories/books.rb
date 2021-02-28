FactoryBot.define do
  factory :book do
    price { 1000 }
    categories { [1,2] }
    published_at { "2021-02-27" }
  end
end
