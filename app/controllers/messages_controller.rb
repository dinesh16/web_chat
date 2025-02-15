# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_channel_and_user

  def new; end

  def create
    @message = @channel_user.messages.new(message_params)

    @new_message = if @message.save
                     Message.new
    else
                      @message
    end

    render :new, formats: :turbo_stream
  end

  private

  def set_channel_and_user
    @channel_user ||= current_user.channel_users.find_by(channel_id: params[:channel_id])
    @channel ||= @channel_user.channel
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
