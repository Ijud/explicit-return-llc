class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.find_by(email: params[:user][:email])
		if @user && @user.authenticate(params[:user][:password])
			login @user
			redirect_to user_path(@user)
		else
			@user = User.new
			render :new
		end
	end

	def destroy
		logout
		redirect_to root_path
	end

end
