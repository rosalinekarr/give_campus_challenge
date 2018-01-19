FactoryBot.define do
  factory :match do
    maximum { rand(1..100000000).to_f * 0.01 }

    trait :dollar_for_dollar do
      type "DollarForDollarMatch"
    end

    trait :dollar_for_donor do
      type "DollarForDonorMatch"
    end
  end
end
