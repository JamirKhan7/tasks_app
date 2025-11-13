module TimestampFormatter
  extend ActiveSupport::Concern

  def formatted_created_at(format = "%d-%m-%Y")
    created_at.strftime(format)
  end
end
