class Item < ApplicationRecord
  has_one_attached :image
  def product_image
    image.attached? ? image : 'no_image.jpg'
  end

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  def add_tax_price
    (self.price * 1.10).round
  end

end
