class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Login efetuado com sucesso"
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'Algo esta errado com seu login'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Voce deslogou com sucesso'
    redirect_to root_path
  end
end