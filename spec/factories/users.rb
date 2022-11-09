FactoryBot.define do
    factory :user do
      name { "Вася_#{rand(999)}" }

      sequence(:email) { |n| "someuser_#{n}@gmail.com" }
      sequence(:phone_number) { |n| "095875122#{n}" }
  
      # Коллбэк — после фазы :build записываем поля паролей, иначе Devise не
      # позволит создать юзера
      after(:build) { |u| u.password_confirmation = u.password = "123456"}
    end
  end