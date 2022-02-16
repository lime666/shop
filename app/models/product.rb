class Product < ApplicationRecord
  validates :title, :description, :price, presence: true
  belongs_to :category

  paginates_per 50

  scope :sort_by_title_asc, -> { order(title: :asc) }
  scope :sort_by_title_desc, -> { order(title: :desc) }
  scope :sort_by_price_asc, -> { order(price: :asc) }
  scope :sort_by_price_desc, -> { order(price: :desc) }
  scope :price_range, -> (min, max) { where('price >= ? AND price <= ?', min, max) }

  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
end
