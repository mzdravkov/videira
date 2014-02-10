class HomeController < ApplicationController
  def index
  end

  def about
  end

  def sites
    redirect_to beyond.new_user_session_path, note: 'You have to be logged in to access this part of the site.' unless user_signed_in?
    @tenants = current_user.tenants
  end
end
