class PublicShareController < ApplicationController
  def show
    @user = User.find(params[:user])
    if params[:token] == @user.token
      @jobs = @user.jobs
      render :show, layout: "public_share"
    else
      flash[:alert] = "Invalid token"
      redirect_to root_path
    end
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The record you were looking for could not be found."
    redirect_to root_path
  end

  def create
    if current_user.token.nil?
      @user = User.find(params[:user])
      @user.generate_token
      @user.save
      redirect_to action: 'show', user: @user.id, token: @user.token
    else
      flash[:alert] = "Token already exists"
      redirect_to root_path
    end
  end

  def remove
    if !current_user.token.nil?
      @user = User.find(params[:user])
      @user.remove_token
      @user.save
      flash[:notice] = "Public share link removed!"
      redirect_to root_path
    else
      flash[:alert] = "No public share link to remove"
      redirect_to root_path
    end
  end
end
