class MypagesController < ApplicationController
  def index

  end

  def show
    @destination = Destination.find(params[:id])
    @user = User.find(params[:id])
  end

  def logout

  end
end
