FactoryBot.define do
  factory :comment, class: Libertree::Model::Comment do
    sequence(:text) { |n| "Comment #{n} text" }
  end
end
