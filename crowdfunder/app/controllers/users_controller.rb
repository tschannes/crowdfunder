class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			#UserMailer.registration_confirmation(@user).deliver
			auto_login(@user)
			flash[:notice] = "Account Created"
			redirect_to root_path
		else
			flash[:error] = "Try again"
			render "new"	
		end
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(user_params)
	end


private
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password)
    end

end