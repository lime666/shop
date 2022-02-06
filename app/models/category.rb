class Category < ApplicationRecord
  validates :title, presence: true
  has_many :products

  paginates_per 50

  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
end
