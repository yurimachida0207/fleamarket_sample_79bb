FactoryBot.define do

  factory :user do
    nickname               {"abe"}
    email                  {"kkk@gmail.com"}
    password               {"0000000"}
    password_confirmation  {"0000000"}
    last_name              {"ddd"}
    first_name             {"kkk"}
    last_name_kana         {"ddd"}
    first_name_kana        {"kkk"}
    birthday               {"2020-03-01"}
  end

end