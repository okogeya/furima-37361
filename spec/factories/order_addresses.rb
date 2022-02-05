FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    prefecture { 2 }
    city { '南函館町' }
    house_number { '1-1' }
    building { '海ハイツ' }
    phone_number { '0111111111' }
    user_id {2}
    item_id {2}
  end
end
