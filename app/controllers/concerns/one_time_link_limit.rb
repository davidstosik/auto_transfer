module OneTimeLinkLimit
  extend ActiveSupport::Concern

  class Error < StandardError; end
  class InvalidToken < Error; end
  class AlreadyUsed < Error; end

  included do
    rescue_from InvalidToken, with: :invalid_token
    rescue_from AlreadyUsed, with: :already_used
  end

  private

    def authorize_once
      raise InvalidToken unless one_time_link
      raise AlreadyUsed if one_time_link.used?
      one_time_link.mark_used
    end

    def one_time_link
      @_one_time_link ||= OneTimeLink.find_by(path: request.path, token: token)
    end

    def token
      params.require(:token)
    end

    def mark_one_time_link_unused
      one_time_link.mark_unused
    end

    def invalid_token
      render plain: "Invalid token.", status: :unauthorized
    end

    def already_used
      render plain: "You already used this link.", status: :gone
    end
end
