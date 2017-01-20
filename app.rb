#encoding: utf-8
require 'sinatra'
require 'rubygems'
#require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get "/about" do
	erb :about
end

get "/visit" do
	erb :visit
end

post "/visit" do

	@user_name  = params[:user_name]
	@user_phone = params[:user_phone]
	@user_time  = params[:user_time]
	@barber 	= params[:barber]
	@color 		= params[:color]

# Хеш

	hh = { 
		:user_name => 'Enter name', 
		:user_phone => 'Enter phone', 
		:user_time => 'Enter time' }

	@error = hh.select {|key,_| params[key] == ""}.values.join(", ")

	

	if @error != ''
		return erb :visit
	end

	erb "Dear #{@user_name}! Your barber: #{@barber}. We will see you: #{@user_time} & before we will call you #{@user_phone}! Your color: #{@color}"
end

#def is_parameters_empty? hh
#	hh.each do |key, value|

		# Если параметр пуст, то
#		if params[key] == ''
			# переменной error присвоить сообщение об ошибке
 			# а value из хеша hh это сообщение об ошибке
#			@error = hh[key]
#			return erb :visit
#		end

#	end	
#end

#	if @user_name == ''
#		@error = 'Enter your name'
# 		return erb :visit
#	end

get "/contacts" do
	erb :contacts
end