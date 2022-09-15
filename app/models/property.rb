class Property < ApplicationRecord
  belongs_to :expert

  validates :price, presence: true
  validates :city, presence: true

end
