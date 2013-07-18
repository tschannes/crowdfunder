class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			auto_login(@user)
			flash[:notice] = "Account created"
			redirect_to root_path
		else
			flash[:error] = "Something went wrong!"
			render "new"	
		end
	end

	def update
		@user = User.cre
	end


private
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password)
    end

end