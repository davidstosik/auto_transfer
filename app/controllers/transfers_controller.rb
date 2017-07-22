class TransfersController < ApplicationController
  include OneTimeLinkLimit

  def execute
    authorize_once
    # TODO: execute transfer
  end
end
