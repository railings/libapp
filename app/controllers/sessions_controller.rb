class SessionsController < ApplicationController

  def new
    @login = Login.new
  end

  def create
    @login = Login.new(params[:login])
    if session[:reader_id] = @login.authenticate
      redirect_to root_url, notice: "You're logged in."
    else
      render :new
    end
  end

  def destroy
    session[:reader_id] = nil
    redirect_to root_url, notice: "You are now logged out."
  end
end