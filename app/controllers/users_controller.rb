class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      flash[:notice] = '注册成功'
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def user_param
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
