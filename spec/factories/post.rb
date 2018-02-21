FactoryBot.define do
  factory :post, class: Libertree::Model::Post do
    sequence(:text) { |n| "Post #{n} text" }
  end
end
