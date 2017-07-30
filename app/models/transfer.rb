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

    shinseibank.transfer_to_registered_account(recipient, amount, remitter_info: message, remitter_info_pos: :before)

    update(executed_at: Time.current)
  end

  private

    def shinseibank
      @_shinseibank ||= ShinseiBank.connect(Rails.configuration.x.shinseibank)
    end
end
