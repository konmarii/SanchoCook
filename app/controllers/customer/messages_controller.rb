class Customer::MessagesController < ApplicationController
  def show
    @producer = Producer.find(params[:id])
    rooms = current_customer.entries.pluck(:room_id)
    entry = Entry.find_by(producer_id: @producer.id, room_id: rooms)
    
    # もしentryしたことあるなら
    unless entry.nil?
      # @roomに上記entryのroomを代入
      @room = entry.room
    else
      # それ以外は新しくroomを作り、
      @room = Room.new
      @room.save
      # entryを会員分と生産者で作る
      Entry.create(customer_id: current_customer.id, producer_id: @producer.id, room_id: @room.id)
    end
    
    @messages = @room.messages
    @message = Message.new(room_id: @room.id)
  end
  
  def create
    @message = Message.new(message_params)
    @message.customer_id = current_customer.id
    @message.save
  end
  
  private

  def message_params
    params.require(:message).permit(:message, :room_id)
  end
end
