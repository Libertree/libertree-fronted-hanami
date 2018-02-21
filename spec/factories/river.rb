FactoryBot.define do
  factory :river, class: Libertree::Model::River do
    sequence(:label) { |n| "River #{n}" }
    query "search terms"
  end
end
