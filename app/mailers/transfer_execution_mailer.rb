class TransferExecutionMailer < ApplicationMailer
  default to: Rails.configuration.x.owner_email

  def email(transfer)
    @transfer = transfer
    @url = signed_execute_url
    mail(subject: "New transfer")
  end

  private

    attr_reader :transfer

    def one_time_link
      @_one_time_link ||= OneTimeLink.create(path: execute_path)
    end

    def execute_path
      execute_transfer_url(transfer, only_path: true)
    end

    def signed_execute_url
      execute_transfer_url(transfer, token: one_time_link.token)
    end
end
