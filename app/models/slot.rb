# frozen_string_literal: true

class Slot < ApplicationRecord
  has_many :slot_collections, dependent: :destroy
end
