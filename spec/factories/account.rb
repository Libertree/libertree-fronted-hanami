FactoryBot.define do
  factory :account, class: AccountRepository do
    username "accountusername"
    # the password is "example"
    password_encrypted "$2a$10$mg6IXITaf/oSQmjWF3fFke.ohTVU3xz497iof1y/shRI2sGaGW0zy"
  end
end
