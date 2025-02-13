# frozen_string_literal: true

class MessagesController < ApplicationController
  # before_action :set_channel
  before_action :set_channel_user
  before_action :set_channel

  def new; end

  def create
    # binding.pry
    @message = @channel_user.messages.new(message_params)

    @new_message = if @message.save
                     Message.new
    else
                     @message
    end

    render :new
  end

  private

  def set_channel
    @channel ||= @channel_user.channel
  end

  def set_channel_user
    @channel_user ||= current_user.channel_users.find_by(channel_id: params[:channel_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
