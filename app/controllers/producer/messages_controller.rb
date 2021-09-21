class Producer::MessagesController < ApplicationController
  before_action :authenticate_producer!
  before_action :permitted_producer
  
  def permitted_producer
    if current_producer.is_permitted != true 
      redirect_to producer_root_path, info: "権限がありません。管理者からの承認をお待ちください。"
    end
  end
  
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

