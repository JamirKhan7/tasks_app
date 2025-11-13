class Task < ApplicationRecord
  include TimestampFormatter

  before_save :normalize_title

  belongs_to :user

  def normalize_title
    self.title = self.title.strip.titleize
  end
end
