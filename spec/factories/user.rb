FactoryBot.define do
  factory :user do
    email { "user123@email.com" }
    password { "password" }
    first_name { "John" }
    last_name  { "Doe" }
  end
end