# frozen_string_literal: true

class SlotCollectionSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :capacity

  def start_time
    object.start_time.strftime('%Y-%m-%d %H:%M:%S')
  end

  def end_time
    object.end_time.strftime('%Y-%m-%d %H:%M:%S')
  end
end
