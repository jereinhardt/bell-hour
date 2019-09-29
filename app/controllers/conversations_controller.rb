class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show]
  before_action :mark_conversation_as_read, only: [:show]

  def index
    @users = policy_scope(User).
      where.not(id: current_user.id).
      order(last_name: :asc)
    @conversations = policy_scope(Conversation).includes(:users)
  end

  def show
    @message = @conversation.messages.new
    authorize(@conversation)
  end

  def create
    if existing_conversation.present?
      redirect_to_existing_conversation
    else
      create_conversation
    end
  end

  def set_conversation
    @conversation = ConversationPresenter.new(
      policy_scope(Conversation).find(params[:id])
    )
  end

  def mark_conversation_as_read
    @conversation.mark_as_read_by_user!(current_user)
  end

  private

  def redirect_to_existing_conversation
    authorize(existing_conversation)
    redirect_to conversation_path(existing_conversation)
  end

  def create_conversation
    @conversation = Conversation.new(users: [current_user, recipient])
    authorize(@conversation)
    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      flash[:notice] = "Something went wrong!"
      render :index
    end
  end

  def existing_conversation
    @existing_conversation ||=
      Conversation.between(current_user, recipient)
  end

  def recipient
    @recipient ||= User.find(params[:recipient_id])
  end
end
