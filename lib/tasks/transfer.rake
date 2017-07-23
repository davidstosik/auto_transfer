namespace :transfer do
  task daily_scheduler: :environment do
    Rails.logger.info("Running rake transfer:daily_scheduler.")

    TransferSchedule.find_each do |transfer_schedule|
      TransferIssuingService.new(transfer_schedule).perform
    end
  end
end
