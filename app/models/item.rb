class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :take_days

  validates :item_name, presence: true
  validates :text,      presence: true
  validates :price,     presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :take_days_id, numericality: { other_than: 1, message: "can't be blank" } 

  with_options presence: true, format: { with: /3[0-9][0-9]|[1-9][0-9][0-9][0-9][0-9][0-9][0-9]\d, message: '半角を使用してください' } do
    validates :price
  end
end
