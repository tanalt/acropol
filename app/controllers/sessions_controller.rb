class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_url
    else
      flash.now[:error] = 'Неправильна комбінація логіну та паролю'
      render 'new'
      # Not quite right!
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
