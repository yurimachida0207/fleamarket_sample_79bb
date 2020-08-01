class SignupController < ApplicationController
  
  def step1
  end

  def step2
    @user = User.new
  end
  
  def step3
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday] = user_params[:birthday]
    @user = User.new
  end

  # def step3
  #   session[:phone_number] = user_params[:phone_number]
  #   session[:address_last_name] = user_params[:address_last_name]
  #   session[:address_first_name] = user_params[:address_first_name]
  #   session[:address_last_name_kana] = user_params[:address_last_name_kana]
  #   session[:address_first_name_kana] = user_params[:address_first_name_kana]
  #   session[:address_number] = user_params[:address_number]
  #   session[:address_prefecture] = user_params[:address_prefecture]
  #   session[:address_name] = user_params[:address_name]
  #   session[:address_block] = user_params[:address_block]
  #   session[:address_building] = user_params[:address_building]
  #   session[:address_phone_number] = user_params[:address_phone_number]
  # end

  def create
    params[:user] = birthday_join
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday],
      phone_number: session[:phone_number],
      address_last_name: session[:address_last_name],
      address_first_name: session[:address_first_name],
      address_last_name_kana: session[:address_last_name_kana],
      address_first_name_kana: session[:address_first_name_kana],
      address_number: session[:address_number],
      address_prefecture: session[:address_prefecture],
      address_name: session[:address_name],
      address_block: session[:address_block],
      address_building: session[:address_building],
      address_phone_number: session[:address_phone_number]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render step1_signup_index_path
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_sigend_in?
  end

  private
    def user_params
      params.require(:user).permit(
        :nickname,
        :email,
        :password,
        :password_confirmation,
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :birthday,
        :phone_number,
        :address_last_name,
        :address_first_name,
        :address_last_name_kana,
        :address_first_name_kana,
        :address_number,
        :address_prefecture,
        :address_name,
        :address_block,
        :address_building,
        :address_phone_number
      )
    end
    
    def birthday_join
      date = params[:user]
      # Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
      return "#{date["birthday(1i)"].to_i}-#{date["birthday(2i)"].to_i}-#{date["birthday(3i)"].to_i}"
    end
end
