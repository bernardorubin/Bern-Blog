class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      #login
      # when you redirect you notice, you have a new req res cycle
      redirect_to root_path, notice: 'Account created successfully!'
    else
      # flash now in render
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    if user_params[:current_password]
      if current_user.authenticate(user_params[:current_password])
        current_user.update(user_params.except(:current_password))
        redirect_to root_path
      else
        redirect_to updatepass_path, notice: 'Password is incorrect bro'
      end
    else
      current_user.update(user_params.except(:current_password))
      redirect_to root_path, notice: 'Password Updated successfully!'
    end
  end
#
  def editpass
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
