require 'recastai'

class MessagesController < ApplicationController
  def create
    question = params[:message][:question]
    build = RecastAI::Build.new('eb3eb800e647916b8dd567caac43430a', 'en')
    response = build.dialog({ type: 'text', content: question }, "#{session.id}")
    @message = Message.new({:question => question,
      :answer => response.messages[0].content,
      :reply_type => response.messages[0].type,
      :conversation_id => session.id})
      
    if @message.save
        render json: @message
    else
        render json: @message.errors, status: :unprocessable_entity
    end
  end


  def new
    @message = Message.new
  end


  def index
      @messages = Message.all
  end

  private
  def message_params
      params.require(:message).permit(:question, :answer, :reply_type, :conversation_id)
  end

end
