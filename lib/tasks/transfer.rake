namespace :transfer do
  task daily_scheduler: :environment do
    DailyTransferSchedulingService.new.perform
  end
end
