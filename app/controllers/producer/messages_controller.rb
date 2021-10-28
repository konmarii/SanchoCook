class Producer::MessagesController < ApplicationController
  before_action :authenticate_producer!
  before_action :permitted_producer

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
    @room = @message.room
    if @message.save
      @entry = Entry.find_by(room_id: @room.id)
      notification = current_producer.active_producer_notifications.new(
        room_id: @room.id,
        message_id: @message.id,
        visitor_producer_id: current_producer.id,
        visited_customer_id: @entry.customer_id,
        checked: false,
        action: 'dm',
        visitor_is_customer: false
      )
      notification.save if notification.valid?
    end
  end

  private

  def permitted_producer
    if !current_producer.is_permitted
      redirect_to producer_root_path, info: "権限がありません。管理者からの承認をお待ちください。"
    end
  end

  def message_params
    params.require(:message).permit(:message, :room_id)
  end
end
