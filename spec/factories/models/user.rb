FactoryBot.define do
  factory :user, class: User do
    email { 'albert' }
    password { '123456'}
  end

  factory :creator, class: User do
    email { 'creator' }
    password { '123456'}
  end

  factory :joiner, class: User do
    email { 'joiner' }
    password { '123456'}
  end
end
