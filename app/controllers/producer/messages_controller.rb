class Producer::MessagesController < ApplicationController
  def index
    @entries = Entry.where(producer_id: current_producer.id)
  end
  
  def show
    @entry = Entry.find(params[:id])
    @customer = @entry.customer
    @room = @entry.room

    @messages = @room.messages
    @message = Message.new(room_id: @room.id)
  end
  
  def create
    @message = Message.new(message_params)
    @message.producer_id = current_producer.id
    @message.save
  end
  
  private

  def message_params
    params.require(:message).permit(:message, :room_id)
  end
end

