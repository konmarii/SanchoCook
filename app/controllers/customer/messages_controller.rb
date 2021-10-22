class Customer::MessagesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @entries = Entry.where(customer_id: current_customer.id)
  end

  def show
    @entry = Entry.find(params[:id])
    @producer = @entry.producer
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
    @room = @message.room
    if @message.save
      @entry = Entry.find_by(room_id: @room.id)
      notification = current_customer.active_customer_notifications.new(
        room_id: @room.id,
        message_id: @message.id,
        visited_producer_id: @entry.producer_id,
        visitor_customer_id: current_customer.id,
        checked: false,
        action: 'dm',
        visitor_is_customer: true
      )
      notification.save if notification.valid?
    end
  end

  private

  def message_params
    params.require(:message).permit(:message, :room_id)
  end
end
