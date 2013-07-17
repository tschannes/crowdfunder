require 'sinatra'
    get '/' do  
      "Hello, World!"  
    end  

 #    get '/about/' do  
 #      'A little about me.'
 #      "You are currently on #{params[:splat][0]}"
 #    end  

 #    get '/:name' do  
 # 	 "hello there, #{params[:name]}"  
	# end 

	get '/form' do  
  		erb :form  
	end 

	post '/form' do 
	x = params[:message][0]
	x = params.reverse.capitalize 
  	"You said '#{x}'"  
	end 