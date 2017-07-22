class TransferSchedule < ApplicationRecord
  validates :recipient, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0 }

  serialize :schedule, IceCube::Schedule

  def occurs_today?
    schedule.occurs_on?(Date.current)
  end

  def create_transfer
    Transfer.create(
      recipient: recipient,
      amount: amount,
      message: message,
    ).tap do |transfer|
      Rails.logger.info("Created Transfer #{transfer.id} from TransferSchedule #{id}.")
    end
  end
end
