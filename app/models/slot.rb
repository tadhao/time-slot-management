# frozen_string_literal: true

class Slot < ApplicationRecord
  has_many :slot_collections, dependent: :destroy

  include SlotAllotment
  include Validations
  validates :total_capacity, numericality: { greater_than: 0, only_integer: true }

  accepts_nested_attributes_for :slot_collections
end
