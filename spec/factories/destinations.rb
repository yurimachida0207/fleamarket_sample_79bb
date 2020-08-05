FactoryBot.define do

  factory :destination do
    ship_last_name               {"abe"}
    ship_first_name              {"shizo"}
    ship_last_name_kana          {"abe"}
    ship_first_name_kana         {"sinzo"}
    phone_number                 {"08012345678"}
    zip_code                     {"1234567"}
    prefecture                   {"東京都"}
    address                      {"港区六本木"}
    second_address               {"6-9-3"}
  end

end