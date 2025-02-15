# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @channel = Channel.first
  end
end
