class WelcomeController < ApplicationController
  def index
    @tips = Tip.all
    @users = User.all
  end
end
