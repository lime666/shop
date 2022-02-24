class Product < ApplicationRecord
  validates :title, :description, :price, presence: true
  belongs_to :category
  has_many :order_items, dependent: :destroy
  has_one_attached :image

  paginates_per 50

  scope :price_range, -> (min, max) { where('price >= ? AND price <= ?', min, max) }
  scope :order_by_type, -> (type) { order(type) }

  def self.search_by(search)
    where('LOWER(title) ILIKE :search OR LOWER(description) ILIKE :search', search: "%#{search.downcase}%")
  end

  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
end
