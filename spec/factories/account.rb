FactoryBot.define do
  factory :account, class: Libertree::Model::Account do
    username "accountusername"
    # the password is "example"
    password_encrypted "$2a$10$mg6IXITaf/oSQmjWF3fFke.ohTVU3xz497iof1y/shRI2sGaGW0zy"

    after(:create) do |account, _|
      FactoryBot.create(:member, account_id: account.id)
    end
  end
end
