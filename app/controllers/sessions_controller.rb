class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    redirect_to User.find_by(email: params[:session][:email])
    else
    flash[:danger] = "Looks like you entered the wrong password, are you sure it's you?"
    render 'new'
    end
  end

  def destroy

  end
end
