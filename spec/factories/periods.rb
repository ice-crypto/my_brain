FactoryBot.define do
  factory :period do
    period { 1 }
    trait :period_3 do
      period { 3 }
    end
    trait :period_7 do
      period { 7 }
    end
    trait :period_15 do
      period { 15 }
    end
    trait :period_90 do
      period { 90 }
    end
    trait :period_240 do
      period { 240 }
    end
    trait :period_549 do
      period { 549 }
    end
    trait :period_1460 do
      period { 365*4 }
    end
  end
end
