class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end  

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)    
  	if @user.save
      flash[:success] = "Welcome to Asokwa Soccer!"
  		redirect_to @user #Rails automatically infers from redirect_to @user that we want to redirect to user_url(@user)
  	else
  		render 'new'
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)	
  	end

end
