class HomeController < ApplicationController
  def index
    @my_portfolio = Portfolio.where(user: current_user.id) if current_user
    # binding.pry
  end
end
