class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true

  def comment_star
    '★' * rating.to_i + '☆' * (5 - rating.to_i)
  end

end
