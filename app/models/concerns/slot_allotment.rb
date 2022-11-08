# frozen_string_literal: true

module SlotAllotment
  extend ActiveSupport::Concern

  included do
    before_create :set_slot_collections
  end

  def set_slot_collections
    time_slot_hash.each do |elem|
      slot_collections.build(
        start_time: Time.at(elem[:start_time]),
        end_time: Time.at(elem[:end_time]),
        capacity: elem[:capacity]
      )
    end
  end

  def time_slot_hash
    tmp_hash = []
    (time_slots.size - 1).times do |index|
      tmp_hash.push({ start_time: time_slots[index], end_time: time_slots[index+1], capacity: 0 })
    end

    capacity_distribution(tmp_hash)
  end

  private

  def capacity_distribution(tmp_hash)
    tmp_capacity = total_capacity
    tmp_hash = tmp_hash.reverse

    until tmp_capacity.zero?
      tmp_hash.size.times do |index|
        tmp_hash[index][:capacity] += 1
        tmp_capacity -= 1
        break if tmp_capacity.zero?
      end
    end

    tmp_hash.reverse
  end

  def time_slots
    @time_slots ||= (start_time.to_i..end_time.to_i).step(15.minute).to_a
  end
end
