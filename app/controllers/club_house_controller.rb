class ClubHouseController < ApplicationController
  def home
    @users = User.all
    @posts = Post.all
  end

  def about
  end
end
