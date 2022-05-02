class RatingValidator < ActiveModel::Validator
  def validate(record)
    if record.rating.present?
      record.errors.add :base, "You've already rated this product."
    end

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
