class DailyTransferSchedulingService
  def perform
    Rails.logger.info("Running TransferSchedulingService.")

    TransferSchedule.find_each do |transfer_schedule|
      perform_on(transfer_schedule)
    end
  end

  private

    def perform_on(transfer_schedule)
      Rails.logger.debug("Performing on TransferSchedule #{transfer_schedule.id}.")
      return unless transfer_schedule.occurs_today?
      transfer = transfer_schedule.create_transfer
      # TODO email one-time link to execute transfer
    end
end
