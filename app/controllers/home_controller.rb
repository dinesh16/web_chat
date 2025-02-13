# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    # binding.pry
    @channel = Channel.first
  end
end
