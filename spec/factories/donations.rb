FactoryBot.define do
  factory :donation do
    amount { rand(1..1000000).to_f * 0.01 }
  end
end
