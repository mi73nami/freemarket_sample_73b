FactoryBot.define do

  factory :user do
    nickname              {""}
    email                 {"yama@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    last_name             {"山崎"}
    first_name            {"充彦"}
    ruby_last_name        {"ヤマザキ"}
    ruby_first_name       {"ミツヒコ"}
    birthdate             {"1920-01-01"}

  end

end