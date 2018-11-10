class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:signin][:name])

    if user && user.authenticate(params[:signin][:password])
      session[:user_id] = user.id
      flash[:notice] = "Signed in succesfully."
      redirect_to root_url
    else
      flash[:notice] = "Access denied " + user.name
      render 'new'
    end
  end
end
