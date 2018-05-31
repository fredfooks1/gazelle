class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @company = current_user.company
  end
end
