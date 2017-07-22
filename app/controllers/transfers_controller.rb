class TransfersController < ApplicationController
  include OneTimeLinkLimit

  def execute
    authorize_once

    # FIXME allow retry on specific errors?
    transfer.execute
  end

  private

    def transfer
      @_transfer ||= Transfer.find(transfer_id)
    end

    def transfer_id
      params[:id]
    end
end
