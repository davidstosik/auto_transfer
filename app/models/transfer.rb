class Transfer < ApplicationRecord
  validates :recipient, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0 }

  def executed?
    !!executed_at
  end

  def execute
    if executed?
      # FIXME raise error?
      Rails.logger.warn("Attempted to execute transfer #{id} again.")
      return
    end

    Rails.logger.info("Executing transfer #{id}.")

    # TODO execute

    update(executed_at: Time.current)
  end
end
