class MessagessController < ApplicationController
  before_action :find_conversation

  def index
    @messages = @conversation.messages

    if @messages.length > 10
        @over_ten = true
        @messages = @messages[-10..-1]
    end

    if params[:m]
    @over_ten = false
    @messages = @converstion.messages
    end

  @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
        redirect_to converstion_messages_path(@conversation)
  end

  def new
     @message = @conversation.messages.new
  end

  private

  def find_conversation
     @converstion = Converstion.find(params[:conversation_id])
  end

  def message_params
     params.require(:message).permit(:body, :user_id)
  end

end