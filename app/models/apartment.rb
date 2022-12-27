class Apartment < ApplicationRecord
  validates :number, presence: true, numericality: { only_integer: true }
  has_many :tenants
  has_many :leases
end
