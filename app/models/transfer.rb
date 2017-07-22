class Transfer < ApplicationRecord
  validates :recipient, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0 }

  def executed?
    !!executed_at
  end

  def execute
    return if executed? # FIXME raise error?
    # TODO execute

    update(executed_at: Time.current)
  end
end
