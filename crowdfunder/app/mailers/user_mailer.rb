class UserMailer < ActionMailer::Base
  default from: "mail@tscherrig.net"

  def registration_confirmation(user)
  	@user = user
  	# attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
  	
  	mail(:to => "#{user.first_name} <#{user.email}>", :subject => "Registered")
  end

  def new_pledge(user)
  	@user = user
  	# attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
  	
  	mail(:to => "#{@user.user.first_name} <#{@user.user.email}>", :subject => "Your project received some backing on CrowdFunder.")
  end
end
