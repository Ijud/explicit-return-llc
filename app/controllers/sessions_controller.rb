class SessionsController < ApplicationController

	def delete
		session[:user_id] = nil
		redirect_to '/'
	end

	def new
		@user = User.new
	end

	def create
		@user = User.find_by(username: params[:user][:username])
		if @user && @user.password = params[:user][:password]
			session[:user_id] = @user.id
			redirect_to '/'
		else
			@user = User.new
			render :new
		end
	end
end