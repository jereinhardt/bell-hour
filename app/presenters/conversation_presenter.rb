class ConversationPresenter < SimpleDelegator
  def messages
    @messages ||= super.where.not(id: nil)
  end
end