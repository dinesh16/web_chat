# frozen_string_literal: true

class ChannelsController < ApplicationController
  before_action :set_channel, only: %i[show]

  def index
    @channels = Channel.all.order(name: :asc)
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  def join
    @channel = Channel.find_by(id: params[:channel_id])

    if @channel.channel_users.find_or_create_by(user: current_user)
      redirect_to channel_path(@channel), notice: t('channels.notices.joined')
    else
      redirect_to channel_path, alert: t('channels.alerts.empty')
    end
  end

  def show
    @new_message = Message.new
  end

  private

  def channel_params
    params.require(:channel).permit(:name)
  end

  def set_channel
    @channel = current_user.channels.find_by(id: params[:channel_id].presence || params[:id])
  end
end
