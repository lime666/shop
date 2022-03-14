class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true

  def comment_star
    #'★' * comment.rating.to_i + '☆' * (5 - comment.rating.to_i)
  end

end
