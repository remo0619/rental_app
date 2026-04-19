class Device < ApplicationRecord
  belongs_to :user
  has_many :requests

  enum status: { available: 0, unavailable: 1 }

  validates :serial, length: { maximum: 30 }, presence: true,
                      uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :device_type, length: { maximum: 20 }, presence: true
end
