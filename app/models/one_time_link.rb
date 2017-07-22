class OneTimeLink < ApplicationRecord
  has_secure_token

  validates :path, presence: true

  def used?
    !!used_at
  end

  def mark_used
    update(used_at: Time.current)
  end

  def mark_unused
    update(used_at: nil)
  end
end
