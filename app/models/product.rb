class Product < ApplicationRecord
  validates :title, :description, :price, presence: true
  belongs_to :category

  paginates_per 50

  #scope :sort_by_title_asc, -> { order(title: :asc) }
  #scope :sort_by_title_desc, -> { order(title: :desc) }
  #scope :sort_by_price_asc, -> { order(price: :asc) }
  #scope :sort_by_price_desc, -> { order(price: :desc) }
  scope :price_range, -> (min, max) { where('price >= ? AND price <= ?', min, max) }
  #scope :search_by, -> { where('title ILIKE ? OR description ILIKE ?', search) }
  scope :order_by_type, -> (type) { order(type) }

  def self.search_by(search)
    where('LOWER(title) ILIKE :search OR LOWER(description) ILIKE :search', search: "%#{search.downcase}%")
  end

  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
end
