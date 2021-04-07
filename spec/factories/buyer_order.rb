FactoryBot.define do
  factory :buyer_order do
    token { 'tok_abcdefghijk00000000000000000' }
    buyer_id        { 1 }
    address_code    { '123-4567' }
    prefecture_id   { 2 }
    city            { "市川市\b" }
    address_line    { '市川' }
    building_name   { 'とちビル' }
    phone_num       { '09012341234' }
  end
end
