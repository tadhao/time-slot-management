# frozen_string_literal: true

# This controller is for administrating other slots
class Api::V1::SlotsController < ApplicationController
  # Sets the slot to be acted upon
  before_action :set_slot, only: [:show, :update, :destroy]

  # GET /api/v1/slots/
  def index
    render json: Slot.all, each_serializer: SlotSerializer, status: :ok
  end

  # GET /api/v1/slots/1
  def show
    render json: @slot, serializer: SlotSerializer, status: :ok
  end

  # PUT|PATCH /api/v1/slots/1
  def update
    if @slot.update(slot_params)
      render json: @slot, serializer: SlotSerializer, status: :ok
    else
      head :unprocessable_entity
    end
  end

  # DELETE /api/v1/slots/1
  def destroy
    if @slot.destroy
      render json: 'Removed slot successfully!', status: :ok
    else
      head :unprocessable_entity
    end
  end

  private

  # Set slot by the primary key
  def set_slot
    @slot = Slot.find(params[:id])
  end

  # Strong parameters for security purposes
  def slot_params
    params.require(:slot).permit(:id, :start_time, :end_time, :total_capacity, slot_collections: [:start_time, :end_time, :capacity])
  end
end
