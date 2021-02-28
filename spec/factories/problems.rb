FactoryBot.define do
  factory :problem, class: Problem do
    body { "問題分本文。" }
    categories { [1,2,3] }
    question_at { Date.current }
    association :period
    association :format
  end
end
