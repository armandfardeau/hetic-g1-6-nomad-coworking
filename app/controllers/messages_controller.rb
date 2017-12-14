class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  def index
    conversation_params(@conversation)
  end

  def create
    @message = @conversation.messages.new(message_params)
    @messages = @conversation.messages.order('created_at DESC')

    return unless @message.save
    respond_to do |format|
      format.js
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content, :user_id)
  end

  def conversation_params(conversation)
    if current_user == conversation.sender || current_user == conversation.recipient
      if current_user == conversation.sender
        @other = conversation.recipient
      else
        @other = conversation.sender
      end
      @messages = conversation.messages.order('created_at DESC')
    else
      redirect_to conversations_path, alert: 'Vous ne pouvez pas accéder à cette page.'
    end
  end
end
