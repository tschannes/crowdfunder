class PledgesController < ApplicationController

	before_filter :require_login, only: [:new, :create], message: "Please log in first."

	def new
		@project = Project.find(params[:project_id])
		@pledge = Pledge.new
	end

	def create
			@project = Project.find(params[:project_id])
			@user = current_user
			#giving @pledge a project_id
			@pledge = @project.pledges.build(strong_params)

			#Giving @pledge a user_id
			#Manually filling in the users id into the pledges table
			@pledge.user_id = @user.id
		
		if @pledge.save
			#sending a confirmation-email
			UserMailer.new_pledge(@pledge).deliver
		
			flash[:notice] = "Thanks for pledging #{@pledge.amount} Dollars to #{@pledge.project.title.upcase}"
			redirect_to project_path(@project)
		else
			flash[:error] = "Something went wrong!"
			redirect_to project_path(@project)
		end
	end

	def strong_params
		params.require(:pledge).permit(:amount)
	end

end
