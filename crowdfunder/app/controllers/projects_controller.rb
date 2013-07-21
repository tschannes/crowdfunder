class ProjectsController < ApplicationController

	def index
		@projects = Project.order("created_at DESC").page(params[:page]).per(8)
		#@number_of_projects_total = Project.all.count
		# @first = @projects.first.id
		# @last = @projects.last.id
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
