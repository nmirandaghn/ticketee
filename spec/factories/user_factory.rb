FactoryGirl.define do
  factory :user do
    name "Eva Luator"
    email "user@example.org"
    password "hunter2"
    password_confirmation "hunter2"

    factory :admin_user do
      admin true
    end
  end
end
