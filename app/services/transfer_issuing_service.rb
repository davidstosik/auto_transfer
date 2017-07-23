class TransferIssuingService
  def initialize(transfer_schedule)
    @transfer_schedule = transfer_schedule
  end

  def perform
    Rails.logger.info("Performing TransferIssuingService on TransferSchedule #{transfer_schedule.id}.")

    return unless transfer_schedule.occurs_today?

    create_transfer
    email_one_time_link
  end

  private

    attr_reader :transfer_schedule, :transfer

    def create_transfer
      @transfer = transfer_schedule.create_transfer
      Rails.logger.info("Created Transfer #{transfer.id}.")
    end

    def email_one_time_link
      # FIXME: using #deliver_now because #deliver_later won't work in rake task?
      TransferExecutionMailer.email(transfer).deliver_now
    end
end
