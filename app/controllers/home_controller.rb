class HomeController < ApplicationController
  def index
    if user_signed_in?
      render "home/index"  # Show home page
    else
      redirect_to new_user_session_path  # Redirect to sign-in page
    end
  end
end
