class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :take_days
  has_one_attached :image
  belongs_to :user
  has_one :order

  validates :item_name, presence: true
  validates :text,      presence: true
  validates :price,     presence: true,
                        numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true, message: 'は300から9999999の間で半角入力してください' }
  validates :image,     presence: { message: 'を選択してください' }

  validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :condition_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :postage_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :take_days_id, numericality: { other_than: 1, message: 'を選択してください' }
end
