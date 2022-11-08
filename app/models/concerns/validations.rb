# frozen_string_literal: true

module Validations
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    validate :datetime_validation
  end

  def datetime_validation
    return if end_time.blank? || start_time.blank?

    if start_time < DateTime.now
      errors.add(:start_time, 'cannot be in the past')
    elsif end_time < start_time
      errors.add(:end_time, 'cannot be before the start date')
    end
  end
end
