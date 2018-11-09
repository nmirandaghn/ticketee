class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(name: params[:signin][:name])

    if user && user.authenticate(params[:signin][:password])
      flash[:notice] = "Signed in succesfully."
      redirect_to root_url
    else
      flash[:notice] = "Access denied"
    end
  end
end
