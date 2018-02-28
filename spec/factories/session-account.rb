FactoryBot.define do
  factory :session_account, class: Libertree::Model::SessionAccount do
    sequence(:sid) { |n| "sessionid#{n}" }
  end
end
