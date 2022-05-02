class Product < ApplicationRecord
  validates :title, :description, :price, presence: true
  belongs_to :category
  has_many :order_items, dependent: :destroy
  has_many :comments
  has_one_attached :image

  paginates_per 50

  scope :price_range, -> (min, max) { where('price >= ? AND price <= ?', min, max) }
  scope :order_by_type, -> (type) { order(type) }


  def self.search_by(search)
    where('LOWER(title) ILIKE :search OR LOWER(description) ILIKE :search', search: "%#{search.downcase}%")
  end

  def product_star
    if comments.blank?
      @avarage_rating = 0
      '☆' * 5
    else
      @average_rating = comments.average(:rating)
      if (@average_rating % 1).zero?
        '★' * @average_rating.to_i + '☆' * (5 - @average_rating.to_i)
      else
        '★' * @average_rating.to_i + '½'
      end
    end
  end

end
