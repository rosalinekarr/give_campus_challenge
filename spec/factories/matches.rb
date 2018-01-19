FactoryBot.define do
  factory :match do
    maximum { rand(1..100000000).to_f * 0.01 }
  end

  factory :dollar_for_dollar_match, parent: :match, class: "DollarForDollarMatch" do

  end

  factory :dollar_for_donor_match, parent: :match, class: "DollarForDonorMatch" do
    amount { rand(1..100000000).to_f * 0.01 }
  end
end
