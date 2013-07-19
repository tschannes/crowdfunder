class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
		total
		@total
	end

	protected

	def total
	  	@total = 0
	  	# @project = Project.find(params[:id])
	  	
	  	@project.pledges.each do |pledge|
	  		@total += pledge.amount
	  	end
	  	@total
	end


end
