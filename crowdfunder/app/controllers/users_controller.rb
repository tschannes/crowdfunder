class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			flash[:notice] = "Account created"
			redirect_to root_path
		else
			render "new", notice: "Something went wrong."
		end
	end


private
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password)
    end

end