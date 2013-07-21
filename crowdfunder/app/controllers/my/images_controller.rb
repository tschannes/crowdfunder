class My::ImagesController < ApplicationController

	def index
		@project = Project.find(params[:project_id])
	end

	def new
		@project = Project.find(params[:project_id])
	end

	def create
		binding.pry
		@project = Project.find(params[:project_id])
		@project.update_attributes(params[:id])
		flash[:notice] = "Image successfully uploaded!"
		redirect_to my_project_path(@project)
	end

end
