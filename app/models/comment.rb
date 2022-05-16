# frozen_string_literal: true

class RatingValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add :base, "You've already rated this product." if record.rating.present?
  end
end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true
  validates :user_id, uniqueness: { scope: :product, message: "You've already rated this product." }

  def comment_star
    '★' * rating.to_i + '☆' * (5 - rating.to_i)
  end
end
