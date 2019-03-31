class Item < ApplicationRecord
  has_many :stations ,dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
end
