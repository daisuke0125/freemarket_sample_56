FactoryBot.define do
    factory :user do
        nickname              { "abe" }
        email                 { "kkk@gmail.com" }
        password              { "00000000" }
        password_confirmation { "00000000" }
        postcode              { "00000000" }
        prefectures           { "aaa" }
        city                  { "aaa" }
        number                { "00000000000" }
        birth_year            { "1111" }
        birth_month           { "11" }
        birth_day             { "11" }
        first_name_kana       { "aa" }
        last_name_kana        { "aa" }
        first_name            { "aa" }
        last_name             { "aa" }
        streetNumber          { "2" }
        building              { "aaa" }
        cordNumber            { "0000000000" }
    end
end