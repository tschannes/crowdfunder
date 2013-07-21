class My::ProjectsController < ApplicationController

	before_filter :correct_user, only: [:edit, :update]

	def new
		@project = Project.new
	end


	def create
		@project = Project.new strong_params
		@project.user_id = current_user.id
		
		if @project.save
		
			flash[:notice] = "Project created"
			redirect_to my_projects_path
		else
			flash[:error] = "not allowed"
			redirect_to my_project_images_path(@project)
		end
	end


	def edit
		@project = Project.find(params[:id])
	end


	def update
		@project = Project.find(params[:id])

		if @project.update_attributes strong_params
			flash[:notice] = "Project was updated successfully."
			redirect_to my_projects_path
		else
			flash[:error] = "not allowed"
			redirect_to my_projects_path
		end
	end


	def index
		@projects = current_user.projects
	end

	def show
	    @project = Project.find(params[:id])
	end

	def destroy
	    @project = Project.find(params[:id])
	    @project.destroy
	    flash[:notice] = "deleted"
	    redirect_to root_path
  	end


	protected

	def correct_user
		@project = Project.find(params[:id])
		unless @project.user == current_user
			flash[:alert] = "doesn't exist"
			redirect_to root_path
		end
	end

	def strong_params
		params.require(:project).permit(:title, :teaser, :description, :goal, :image)
	end
end
