FactoryBot.define do
  factory :comment do
    body { 'test' }
    association :user
    association :article
  end
end
