class ConversationsController < ApplicationController
  before_action :set_conversation, only: :show

  def index
    @conversations = Conversation.all
    json_response(@conversations, 200)
  end

  def create
    @conversation = Conversation.create(conversation_params)
    render json: @conversation
  end

  def show
    json_response(@conversation, 200)
  end

  def destroy
    if @conversation.destroy
      render json: 'Berhasil Menghapus Data'
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.require(:conversation).permit(:title, user_ids: [])
  end
end
