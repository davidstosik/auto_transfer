class TransferSchedule < ApplicationRecord
  validates :recipient, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0 }

  serialize :schedule, IceCube::Schedule
end
