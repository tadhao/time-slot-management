# frozen_string_literal: true

class SlotCollection < ApplicationRecord
  belongs_to :slot

  include Validations
  validates :capacity, numericality: { greater_than: 0, only_integer: true }
end
