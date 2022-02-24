class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  enum status: %i[in_progress ordered canceled]

  def total
    order_items.collect{|order_item| order_item.valid? ? order_item.product.price * order_item.quantity : 0}.sum
  end

end
