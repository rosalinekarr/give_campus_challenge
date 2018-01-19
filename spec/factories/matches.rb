FactoryBot.define do
  factory :match do
    maximum { rand(1..100000000).to_f * 0.01 }
  end
end
