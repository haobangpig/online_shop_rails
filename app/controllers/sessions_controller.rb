class SessionsController < ApplicationController
  def new
  end

  def create
    if user = login(params[:email], params[:password])
      flash[:notice] = 'login success'
      redirect_to root_path
    else
      flash[:notice] = 'email or password incorrect'
      redirect_to new_session_path
    end
  end

  def destroy
    logout
    flash[:notice] = 'logout success'
    redirect_to root_path
  end
end
