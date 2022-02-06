class Product < ApplicationRecord
  validates :title, :description, :price, presence: true
  belongs_to :category

  paginates_per 50

  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
end
