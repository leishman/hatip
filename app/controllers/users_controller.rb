class UsersController < ApplicationController

  before_filter :redirect_if_empty_profile, only: [:show]

  def show
     @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    if @user.save
      redirect_to user_path
    else
      flash[:errors] = @user.errors.full_messages
      render "update_form_error"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path
    end
  end

  def create_verification
     user = User.find(params[:user])
     user.verified = true
     user.save ? verified = "User has been verified" : verified = "There was an error"
     render json: {verified: verified}
   end

   def revoke_verification
    user = User.find(params[:user])
    user.verified = true
    user.save ? verified = "User has been verified" : verified = "There was an error"
    render json: {verified: verified}
  end







end