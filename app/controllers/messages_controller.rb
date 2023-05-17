class MessagesController < ApplicationController
  before_action :set_conversation
  before_action :set_message, only: :show

  def index
    @messages = Message
    json_response(@messages, 200)
  end

  def create  
    @message = @conversation.messages.build(params_message)
    p params_message
    if @message.save
      render json: @message
    end
  end

  def show
    json_response(@message, 200)
  end

  def destroy
    @message.destroy
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def params_message
    params.require(:message).permit(:sender_id, :recipient_id, :content)
  end
end
