class SessionsController < ApplicationController

	def new
	end

	def create
		user = login(params[:email], params[:password], params[:remember_me_token])
		if user
			flash[:notice] =  "Logged in!"
			redirect_back_or_to root_path
		else
			flash.now.alert = "Something went wrong!"
			render "new"
		end
	end

	def destroy
		logout
		flash[:notice] = "Logged out!"
		redirect_to root_path
	end
end
