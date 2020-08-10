class MypagesController < ApplicationController
  def index
    if user_signed_in?
      @hello_user = User.find(current_user.id)
    end
  end

  def show
  end

  def logout
    if user_signed_in?
      @hello_user = User.find(current_user.id)
    end
  end
end
