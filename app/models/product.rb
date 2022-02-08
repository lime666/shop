class Product < ApplicationRecord
  validates :title, :description, :price, presence: true
  belongs_to :category

  paginates_per 50

  scope :order_by_title_asc, -> { order(title: :asc) }
  scope :order_by_title_desc, -> { order(title: :desc) }
  scope :order_by_price_asc, -> { order(price: :asc) }
  scope :order_by_price_desc, -> { order(price: :desc) }

  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
end
