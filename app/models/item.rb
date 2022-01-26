class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :take_days
  has_one_attached :image
  belongs_to :user

  validates :item_name, presence: true
  validates :text,      presence: true
  validates :price,     presence: true,
                        numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '300から9999999の間で半角入力してください' }
  validates :image,     presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :take_days_id, numericality: { other_than: 1, message: "can't be blank" }
end
