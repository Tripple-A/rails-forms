# frozen_string_literal: true

class UsersController < ApplicationController
  
  def index
    
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end


  def edit
    @user = User.find(
      params[:id]
    )
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.save
      flash[:success] = 'Your details have been edited'
      redirect_to edit_user_path
    else
      flash[:failure] = 'Your details have not been updated,Please fix any errors'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
