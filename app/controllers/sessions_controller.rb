class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    # binding.pry
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id

      redirect_to user_path(user)
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  # def user_params
  #   params.require(:user).permit(:username, :password, :password_confirmation)
  # end

end
