class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  #before_save :set_total

  enum status: %i[in_progress ordered canceled]

  def total
    #order_items.collect{|order_item| order_item.valid? ? order_item.unit_price * order_item.quantity : 0}.sum
  end

  private
  def set_total
    #self[:total] = total
  end
end
