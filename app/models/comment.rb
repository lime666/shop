class RatingValidator < ActiveModel::Validator
  def validate(record)
    #product_user_item = OrderItem.select("product_id, user_id").distinct
    #product_user_comment = Comment.select("product_id, user_id").distinct


    if current_user.order_items.exclude?(product_id: product.id) && record.rating.present?
      record.errors.add :base, "You've already commented this product."
    end
    #if record.rating.present?
    #  record.errors.add :base, "You've already rate this product."
    #if record.body.present? && record.rating.present? && product_user_item.include?(product_user_comment)
    #  record.errors.add :base, "You've already commented this product."
    #end

  end


end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true

  validates_with RatingValidator

  def comment_star
    '★' * rating.to_i + '☆' * (5 - rating.to_i)
  end

end
