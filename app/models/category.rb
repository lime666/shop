# frozen_string_literal: true

class Category < ApplicationRecord
  validates :title, presence: true
  has_many :products
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :subcategories, class_name: 'Category', foreign_key: :parent_id

  paginates_per 50

  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
end
