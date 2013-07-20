ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587, 
	:domain => "tscherrig.net",
	:user_name => "tscherrig",
	:password => "secret",
	:authentication => "plain",
	:enable_startttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
# Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
