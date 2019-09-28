class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    @message = @conversation.messages.new(message_creation_params)
    authorize @message
    if @message.save
      redirect_to conversation_path(@conversation)
    else
      flash[:notice] = "We weren't able to send that message. Please try again."
      render "conversations/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_creation_params
    message_params.merge(sender: current_user)
  end

  def set_conversation
    @conversation = ConversationPresenter.new(
      Conversation.find(params[:conversation_id])
    )
  end
end
