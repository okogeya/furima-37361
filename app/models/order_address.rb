class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :house_number, :building, :phone_number, :order_id, :item_id, :user_id

  with_options presence: true do
    validates :city
    validates :house_number
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A0[0-9]{9,10}\z/, message:"10桁以上11桁以内の半角数値で入力してください（ハイフンなし）"}
  end
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture: prefecture, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end